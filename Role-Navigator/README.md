# TX Directory - Role-Based AI Prompt Management System

A comprehensive web application for managing and accessing role-specific AI prompts and use cases. Built with React, Express, and TypeScript.

## 🏗️ Architecture Overview

### Frontend (React + Vite)
- **Technology Stack**: React 18, TypeScript, Vite, TailwindCSS, Framer Motion
- **UI Components**: Radix UI + shadcn/ui components
- **State Management**: TanStack Query for server state
- **Routing**: Wouter (lightweight React router)
- **Theme**: Dark/light theme support with next-themes

### Backend (Express + TypeScript)
- **Technology Stack**: Express.js, TypeScript, Drizzle ORM
- **API**: RESTful API with Zod validation
- **Data Storage**: Currently using mock storage (see Database section below)

## 🔄 How It Works

### 1. Data Flow
```
Frontend (React) → API Call → Backend (Express) → Storage → Response → Frontend Display
```

### 2. Frontend Process
1. **Initial Load**: React app loads and calls `/api/roles` endpoint
2. **Data Fetching**: Uses TanStack Query to fetch role data from backend
3. **Display**: Shows roles in sidebar, use cases in grid
4. **Interaction**: Users can search, select roles, and view prompt templates
5. **Copy Function**: Users can copy prompt templates to clipboard

### 3. Backend Process
1. **API Server**: Express server listens on port 5001
2. **Route Handling**: `/api/roles` endpoint returns all roles with use cases
3. **Data Storage**: Currently uses mock storage with predefined data
4. **Response**: Returns JSON data with role categories and use cases

## 🗄️ Database & Storage

### Current Setup
- **Mock Storage**: Currently using in-memory mock data (no real database)
- **Location**: `/server/storage.ts` - `MockStorage` class
- **Data**: 19 roles across 6 categories with 67 use cases

### Database Schema (When Real DB is Used)
```sql
-- Roles Table
CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  category TEXT NOT NULL,
  name TEXT NOT NULL
);

-- Use Cases Table  
CREATE TABLE use_cases (
  id SERIAL PRIMARY KEY,
  role_id INTEGER NOT NULL REFERENCES roles(id),
  title TEXT NOT NULL,
  prompt_template TEXT DEFAULT ''
);
```

### Environment Variables
```bash
DATABASE_URL=postgresql://localhost:5432/role_navigator  # Currently not used (mock storage)
PORT=5001                                           # Backend port
NODE_ENV=development                                  # Environment mode
```

## 📝 Prompt Management

### Current State
- **Prompt Templates**: Stored in `promptTemplate` field of use cases
- **Display**: Currently showing empty prompt area (as per requirements)
- **Copy Function**: Copies empty string (ready for real prompts)

### How to Add Real Prompts

#### Method 1: Update Mock Data
Edit `/server/storage.ts` and add real prompt templates:

```typescript
{
  id: 1,
  roleId: 1,
  title: "Technology strategy planning",
  promptTemplate: `You are a Chief Technology Officer (CTO) helping with technology strategy planning.

Context: {context}
Task: {task}
Requirements: {requirements}

Please provide:
1. Strategic technology recommendations
2. Risk assessment
3. Implementation roadmap
4. Resource requirements

Focus on: {focus_area}`
}
```

#### Method 2: Use Real Database
1. Set up PostgreSQL database
2. Update `.env` with correct `DATABASE_URL`
3. Replace `MockStorage` with `DatabaseStorage` in `/server/storage.ts`
4. Run migrations: `npm run db:push`

### How Prompts Flow to Frontend

1. **Storage**: Prompt templates stored in database/mock storage
2. **API Response**: Backend returns `promptTemplate` field in use case data
3. **Frontend Display**: Currently shows empty (line 293 in `Home.tsx`)
4. **Copy Function**: Currently copies empty string (line 62 in `Home.tsx`)

To enable real prompts:
```typescript
// In Home.tsx line 293, change:
value=""
// To:
value={activeUseCase?.promptTemplate || ""}

// In Home.tsx line 62, change:
await navigator.clipboard.writeText("");
// To:
await navigator.clipboard.writeText(activeUseCase?.promptTemplate || "");
```

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ (tested with 18.20.8)
- npm or yarn

### Installation
```bash
cd /Users/mohammedriyaz/Downloads/TX_NEW_PROMPT/Role-Navigator
npm install
```

### Running the Application

#### Option 1: Development Mode (Recommended)
Open two terminal windows:

**Terminal 1 - Backend:**
```bash
cd /Users/mohammedriyaz/Downloads/TX_NEW_PROMPT/Role-Navigator
PORT=5001 npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd /Users/mohammedriyaz/Downloads/TX_NEW_PROMPT/Role-Navigator
npx vite --config vite.config.ts
```

#### Option 2: Production Mode
```bash
npm run build
npm start
```

### Access the Application
- Frontend: http://localhost:5173
- Backend API: http://localhost:5001/api/roles

## 📁 Project Structure

```
Role-Navigator/
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/     # UI components
│   │   ├── hooks/         # React hooks
│   │   ├── pages/         # Page components
│   │   └── lib/          # Utilities
│   └── index.html        # Entry point
├── server/               # Express backend
│   ├── index.ts         # Server entry
│   ├── routes.ts        # API routes
│   ├── storage.ts       # Data storage layer
│   └── db.ts          # Database connection
├── shared/              # Shared types and routes
│   ├── schema.ts       # Database schemas
│   └── routes.ts       # API route definitions
├── package.json        # Dependencies and scripts
└── vite.config.ts      # Vite configuration
```

## 🔧 Available Scripts

```bash
npm run dev          # Start backend in development
npm run build        # Build for production
npm start           # Start production server
npm run check       # TypeScript type checking
npm run db:push     # Push database schema (when using real DB)
```

## 🎯 Features

### Current Features
- ✅ Role browsing by category
- ✅ Use case filtering and search
- ✅ Dark/light theme toggle
- ✅ Responsive design
- ✅ Copy prompt to clipboard
- ✅ Smooth animations and transitions
- ✅ 19 predefined roles with 67 use cases

### Future Enhancements
- 🔄 Real prompt templates
- 🔄 User authentication
- 🔄 Custom prompt creation
- 🔄 Prompt editing interface
- 🔄 Export/import functionality
- 🔄 Real database integration

## 🛠️ Development Notes

### Frontend Key Files
- `client/src/pages/Home.tsx` - Main application interface
- `client/src/hooks/use-roles.ts` - API data fetching
- `client/src/components/directory-sidebar.tsx` - Role navigation

### Backend Key Files
- `server/index.ts` - Express server setup
- `server/routes.ts` - API endpoints and seed data
- `server/storage.ts` - Data storage (currently mock)

### API Endpoints
- `GET /api/roles` - Returns all roles with use cases
- Response format:
```json
[
  {
    "id": 1,
    "category": "Executive and Leadership Roles",
    "name": "Chief Technology Officer (CTO)",
    "useCases": [
      {
        "id": 1,
        "roleId": 1,
        "title": "Technology strategy planning",
        "promptTemplate": ""
      }
    ]
  }
]
```

## 🔍 Troubleshooting

### Common Issues

1. **Port Already in Use**
   ```bash
   # Kill existing processes
   pkill -f "vite"
   pkill -f "tsx server/index.ts"
   ```

2. **Frontend Shows "Failed to load directory"**
   - Check if backend is running on port 5001
   - Verify proxy configuration in `vite.config.ts`

3. **Node.js Version Issues**
   - Application tested with Node.js 18.20.8
   - Vite downgraded to 5.4.21 for compatibility

### Debug Mode
- Frontend: Open browser DevTools (F12)
- Backend: Check terminal for Express logs
- API: Test with `curl http://localhost:5001/api/roles`

## 📄 License

MIT License - Feel free to use and modify for your projects.

---

**Note**: This application is currently running with mock data and empty prompt templates. To use real prompts, update the `promptTemplate` fields in the storage layer and modify the frontend display logic as described in the "Prompt Management" section.
