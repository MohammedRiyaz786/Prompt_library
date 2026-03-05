import type { RoleWithUseCases, InsertRole, InsertUseCase } from "@shared/schema";
import { db } from "./db";
import { roles, useCases } from "@shared/schema";
import { eq } from "drizzle-orm";

export interface IStorage {
  getRolesWithUseCases(): Promise<RoleWithUseCases[]>;
  createRole(role: InsertRole): Promise<{ id: number; category: string; name: string; }>;
  createUseCase(useCase: InsertUseCase): Promise<any>;
}

export class DatabaseStorage implements IStorage {
  async getRolesWithUseCases(): Promise<RoleWithUseCases[]> {
    const allRoles = await db.select().from(roles);
    const allUseCases = await db.select().from(useCases);
    
    return allRoles.map(role => ({
      ...role,
      useCases: allUseCases.filter(useCase => useCase.roleId === role.id)
    }));
  }

  async createRole(role: InsertRole) {
    const [newRole] = await db.insert(roles).values(role).returning();
    return { id: newRole.id, category: newRole.category, name: newRole.name };
  }

  async createUseCase(useCase: InsertUseCase) {
    const [newUseCase] = await db.insert(useCases).values(useCase).returning();
    return { id: newUseCase.id, roleId: newUseCase.roleId, title: newUseCase.title, promptTemplate: newUseCase.promptTemplate };
  }
}

// Mock data for seeding
const mockData: RoleWithUseCases[] = [
  // Executive and Leadership Roles
  {
    id: 1,
    category: "Executive and Leadership Roles",
    name: "Engineering Manager / Technical Director",
    useCases: [
      { id: 5, roleId: 1, title: "Technical design guidance", promptTemplate: "" },
      { id: 6, roleId: 1, title: "Team performance summaries", promptTemplate: "" },
      { id: 7, roleId: 1, title: "Architecture review prompts", promptTemplate: "" },
      { id: 8, roleId: 1, title: "Resource planning assistance", promptTemplate: "" }
    ]
  },
  // Product and Project Roles
  {
    id: 2,
    category: "Product and Project Roles",
    name: "Product Manager",
    useCases: [
      { id: 9, roleId: 2, title: "Product requirement generation", promptTemplate: "" },
      { id: 10, roleId: 2, title: "User story creation", promptTemplate: "" },
      { id: 11, roleId: 2, title: "Acceptance criteria drafting", promptTemplate: "" },
      { id: 12, roleId: 2, title: "Feature prioritization support", promptTemplate: "" }
    ]
  },
  {
    id: 3,
    category: "Product and Project Roles",
    name: "Business Analyst",
    useCases: [
      { id: 13, roleId: 3, title: "Requirement documentation templates", promptTemplate: "" },
      { id: 14, roleId: 3, title: "Process mapping assistance", promptTemplate: "" },
      { id: 15, roleId: 3, title: "Gap analysis prompts", promptTemplate: "" },
      { id: 16, roleId: 3, title: "Data interpretation summaries", promptTemplate: "" }
    ]
  },
  {
    id: 4,
    category: "Product and Project Roles",
    name: "Project Manager",
    useCases: [
      { id: 17, roleId: 4, title: "Project plan drafting", promptTemplate: "" },
      { id: 18, roleId: 4, title: "Risk management templates", promptTemplate: "" },
      { id: 19, roleId: 4, title: "Sprint planning support", promptTemplate: "" },
      { id: 20, roleId: 4, title: "Stakeholder communication drafts", promptTemplate: "" }
    ]
  },
  // Engineering and Development Roles
  {
    id: 5,
    category: "Engineering and Development Roles",
    name: "Software Engineer (Frontend / Backend / Full Stack)",
    useCases: [
      { id: 21, roleId: 5, title: "Code generation", promptTemplate: "" },
      { id: 22, roleId: 5, title: "Architecture design guidance", promptTemplate: "" },
      { id: 23, roleId: 5, title: "API design prompts", promptTemplate: "" },
      { id: 24, roleId: 5, title: "Debugging and optimization support", promptTemplate: "" }
    ]
  },
  {
    id: 6,
    category: "Engineering and Development Roles",
    name: "Technical Lead",
    useCases: [
      { id: 25, roleId: 6, title: "Code review summaries", promptTemplate: "" },
      { id: 26, roleId: 6, title: "Best practice recommendations", promptTemplate: "" },
      { id: 27, roleId: 6, title: "Design pattern suggestions", promptTemplate: "" },
      { id: 28, roleId: 6, title: "Technical mentoring guidance", promptTemplate: "" }
    ]
  },
  {
    id: 7,
    category: "Engineering and Development Roles",
    name: "DevOps / Site Reliability Engineer",
    useCases: [
      { id: 29, roleId: 7, title: "CI/CD pipeline templates", promptTemplate: "" },
      { id: 30, roleId: 7, title: "Infrastructure as Code examples", promptTemplate: "" },
      { id: 31, roleId: 7, title: "Monitoring configuration prompts", promptTemplate: "" },
      { id: 32, roleId: 7, title: "Reliability and incident analysis", promptTemplate: "" }
    ]
  },
  // Quality and Testing Roles
  {
    id: 8,
    category: "Quality and Testing Roles",
    name: "QA Engineer / Tester",
    useCases: [
      { id: 33, roleId: 8, title: "Test Case Generation from User Story", promptTemplate: "ROLE:\nYou are a senior QA Engineer specializing in Native iOS and Android mobile application testing.\n\nCONTEXT:\nProject: [Project Name]\nStory Title: [Story Title]\nStory ID: [JIRA ID]\nPlatform: iOS | Android | Both\nBuild Version: [Version Number or \"Not yet available\"]\nTesting Type: Functional | Regression | Smoke | Exploratory\n\nTASK:\nGenerate exhaustive test cases for the user story and acceptance criteria provided below.\nYou MUST evaluate ALL of the following categories — do not skip any:\n  - Happy path (primary success flow)\n  - Negative / error paths (invalid input, wrong state, network failure)\n  - Edge cases (boundary values, empty states, maximum limits)\n  - Platform-specific behavior (iOS vs Android differences)\n  - Accessibility (screen reader, font scaling, contrast)\n\nEach test case must be fully independent and executable without referencing another test case.\nEvaluate the ENTIRE story and ALL acceptance criteria before writing any test case.\nDo NOT skip negative or edge case scenarios — these are as important as happy path.\n\nUSER STORY & ACCEPTANCE CRITERIA:\n[Paste story and AC here]\n\nCONSTRAINTS:\n- Test cases must be written so a junior tester can execute them without clarification\n- All preconditions must be listed explicitly — assume nothing\n- Platform differences between iOS and Android must be called out in their own test cases\n- Do not group multiple verifications into one expected result — one check per test case\n\nOUTPUT FORMAT:\nTEST CASE [N]:\nTitle: [Short descriptive title]\nType: Happy Path | Negative | Edge Case | Accessibility | Platform-Specific\nPlatform: iOS | Android | Both\nPreconditions:\n  - [Setup requirement 1]\n  - [Setup requirement 2]\nSteps:\n  1. [Step]\n  2. [Step]\n  3. [Step]\nExpected Result: [Exact, observable outcome]\nNotes: [iOS/Android difference, known risk, or \"None\"]\n\n---\n(repeat for every test case)\n\nSUMMARY:\nTotal Test Cases: [N]\nHappy Path: [N] | Negative: [N] | Edge Case: [N] | Accessibility: [N] | Platform-Specific: [N]\nCoverage Gaps: [Topics not covered due to missing AC — or \"None\"]" },
      { id: 34, roleId: 8, title: "Bug Report Drafting", promptTemplate: "ROLE:\nYou are a QA Engineer writing a formal bug report for a Native iOS/Android mobile application.\n\nCONTEXT:\nProject: [Project Name]\nApp Version: [Version]\nDevice Model: [e.g., iPhone 15 Pro | Samsung Galaxy S24]\nOS Version: [e.g., iOS 17.4 | Android 14]\nEnvironment: Dev | QA | Staging | Production\nBuild Number: [Build #]\n\nTASK:\nUsing the raw observation below, produce a complete, developer-ready bug report.\nSteps to reproduce must be precise enough for a developer to replicate on first attempt.\nClassify severity and priority independently — a cosmetic bug can be high priority\nif it affects a release deadline.\nIf information needed to complete a field is missing, mark it [NEEDS CAPTURE] — never leave blank.\n\nRAW OBSERVATION:\n[Describe what you saw — can be informal]\n\nCONSTRAINTS:\n- Steps to reproduce must be numbered and atomic — one action per step, never compound\n- Do not include opinion or blame — only observable, factual statements\n- Actual Result must describe exactly what happened, not what you think caused it\n- Reproducibility must be based on actual attempts — do not guess\n\nOUTPUT FORMAT:\nBUG REPORT\nTitle: [Clear searchable title — what broke + where + on what platform]\nSeverity: Critical | High | Medium | Low\nPriority: High | Medium | Low\nPlatform: iOS | Android | Both\nStatus: New\n\nEnvironment:\n  App Version: [Version] | Build: [#] | Device: [Model] | OS: [Version] | Env: [Dev/QA/Staging/Prod]\n\nSteps to Reproduce:\n  1. [Step]\n  2. [Step]\n  3. [Step]\n  ...\n\nExpected Result: [What should have happened]\nActual Result: [What actually happened — observable fact only]\nReproducibility: Always | Intermittent ([N] of [N] attempts) | Once\n\nAttachments: [Screenshot / Video / Logs — or \"Pending capture\"]\nWorkaround: [Known workaround if any — or \"None\"]\nRelated Tickets: [Linked JIRA IDs — or \"None\"]\nNotes: [Any additional context — or \"None\"]" },
      { id: 35, roleId: 8, title: "Test strategy documentation", promptTemplate: "" },
      { id: 36, roleId: 8, title: "Regression Suite Prioritization", promptTemplate: "ROLE:\nYou are a senior QA Engineer prioritizing a regression test suite for a\nNative iOS/Android mobile application release.\n\nCONTEXT:\nProject: [Project Name]\nRelease Version: [Version]\nPlatform: iOS | Android | Both\nRelease Type: Major | Minor | Hotfix | Patch\nTime Available for Regression: [e.g., 2 days | 1 sprint | 4 hours]\nRelease Date: [DD/MM/YYYY]\n\nTASK:\nUsing the release scope and existing test suite provided below, prioritize regression\ntests into three tiers: Must Run, Should Run, and Can Skip.\nBase prioritization on: areas changed in this release, user-facing critical paths,\nhistorical defect hotspots, and platform-specific risks.\nEvaluate the ENTIRE test suite before assigning tiers — do not assign on first pass.\nFlag any area of the app changed in this release that has NO regression test coverage.\n\nRELEASE SCOPE (stories/changes in this release):\n[Paste list of stories, PRs, or change descriptions here]\n\nEXISTING REGRESSION TEST SUITE:\n[Paste test case IDs, titles, and areas they cover]\n\nHISTORICAL DEFECT AREAS (if known):\n[Paste known bug-prone areas or \"Not available\"]\n\nCONSTRAINTS:\n- Must Run tier must be executable within the time available stated above\n- Do not assign Must Run to tests unrelated to this release's changes\n- Every changed area must have at least one Must Run test — flag if it doesn't\n- Platform-specific tests must be tiered separately for iOS and Android\n\nOUTPUT FORMAT:\nREGRESSION PRIORITIZATION REPORT\nRelease: [Version] | Platform: [iOS/Android/Both] | Time Budget: [X days/hours]\nGenerated: [DD/MM/YYYY]\n\n🔴 MUST RUN ([N] tests — Est. [X hours]):\n| Test ID | Test Title | Area | Platform | Reason for Priority |\n|---|---|---|---|---|\n| TC-001 | [Title] | [Feature area] | iOS | [Changed in this release] |\n\n🟡 SHOULD RUN IF TIME PERMITS ([N] tests — Est. [X hours]):\n| Test ID | Test Title | Area | Platform | Reason |\n|---|---|---|---|---|\n\n🟢 CAN SKIP THIS RELEASE ([N] tests):\n| Test ID | Test Title | Reason for Skip |\n|---|---|---|\n\nCOVERAGE GAPS (changed areas with no regression test):\n| Changed Area | Story ID | Risk | Recommendation |\n|---|---|---|---|\n| [Area] | [ID] | High/Med/Low | [Create new test / Manual exploratory] |\n\nSUMMARY:\nTotal Suite Size: [N] | Must Run: [N] | Should Run: [N] | Skipped: [N]\nEstimated Must Run Duration: [X hours] | Fits Time Budget: Yes | No" }
    ]
  },
  {
    id: 9,
    category: "Quality and Testing Roles",
    name: "Automation Test Engineer",
    useCases: [
      { id: 37, roleId: 9, title: "Automation script generation", promptTemplate: "" },
      { id: 38, roleId: 9, title: "Framework design prompts", promptTemplate: "" },
      { id: 39, roleId: 9, title: "CI integration guidance", promptTemplate: "" }
    ]
  },
  {
    id: 10,
    category: "Quality and Testing Roles",
    name: "SDET",
    useCases: [
      { id: 40, roleId: 10, title: "Advanced test scenario design", promptTemplate: "" },
      { id: 41, roleId: 10, title: "Test data generation", promptTemplate: "" },
      { id: 42, roleId: 10, title: "Automation infrastructure setup", promptTemplate: "" },
      { id: 43, roleId: 10, title: "Mobile Accessibility Audit Report", promptTemplate: "" }
    ]
  },
  {
    id: 11,
    category: "Quality and Testing Roles",
    name: "Test Architect",
    useCases: [
      { id: 44, roleId: 11, title: "Testing strategy design", promptTemplate: "" },
      { id: 45, roleId: 11, title: "Tool evaluation support", promptTemplate: "" },
      { id: 46, roleId: 11, title: "Quality metrics definition", promptTemplate: "" }
    ]
  },
  {
    id: 12,
    category: "Quality and Testing Roles",
    name: "QA Lead / Test Manager",
    useCases: [
      { id: 47, roleId: 12, title: "Test planning documentation", promptTemplate: "" },
      { id: 48, roleId: 12, title: "Quality KPI reports", promptTemplate: "" },
      { id: 49, roleId: 12, title: "Process improvement recommendations", promptTemplate: "" },
      { id: 50, roleId: 12, title: "UAT Sign-off Report", promptTemplate: "" }
    ]
  },
  // Documentation and Support Roles
  {
    id: 13,
    category: "Documentation and Support Roles",
    name: "Technical Writer",
    useCases: [
      { id: 49, roleId: 13, title: "API documentation templates", promptTemplate: "" },
      { id: 50, roleId: 13, title: "User manual drafting", promptTemplate: "" },
      { id: 51, roleId: 13, title: "Release notes creation", promptTemplate: "" },
      { id: 52, roleId: 13, title: "Standard operating procedures", promptTemplate: "" }
    ]
  },
  {
    id: 14,
    category: "Documentation and Support Roles",
    name: "Technical Support (L1/L2/L3)",
    useCases: [
      { id: 53, roleId: 14, title: "Troubleshooting guides", promptTemplate: "" },
      { id: 54, roleId: 14, title: "Customer response templates", promptTemplate: "" },
      { id: 55, roleId: 14, title: "Root cause analysis summaries", promptTemplate: "" }
    ]
  },
  // Other Cross Functional Roles
  {
    id: 15,
    category: "Other Cross Functional Roles",
    name: "UX/UI Designer",
    useCases: [
      { id: 56, roleId: 15, title: "Design critique prompts", promptTemplate: "" },
      { id: 57, roleId: 15, title: "UI specification drafting", promptTemplate: "" },
      { id: 58, roleId: 15, title: "User experience analysis", promptTemplate: "" }
    ]
  },
  {
    id: 16,
    category: "Other Cross Functional Roles",
    name: "Data Engineer",
    useCases: [
      { id: 59, roleId: 16, title: "ETL pipeline prompts", promptTemplate: "" },
      { id: 60, roleId: 16, title: "Schema design support", promptTemplate: "" },
      { id: 61, roleId: 16, title: "Data optimization guidance", promptTemplate: "" }
    ]
  },
  {
    id: 17,
    category: "Other Cross Functional Roles",
    name: "Data Scientist",
    useCases: [
      { id: 62, roleId: 17, title: "Model experimentation guidance", promptTemplate: "" },
      { id: 63, roleId: 17, title: "Data analysis prompts", promptTemplate: "" },
      { id: 64, roleId: 17, title: "Insight generation support", promptTemplate: "" }
    ]
  },
  {
    id: 18,
    category: "Other Cross Functional Roles",
    name: "Security Engineer",
    useCases: [
      { id: 65, roleId: 18, title: "Threat analysis prompts", promptTemplate: "" },
      { id: 66, roleId: 18, title: "Secure coding guidelines", promptTemplate: "" },
      { id: 67, roleId: 18, title: "Vulnerability assessment support", promptTemplate: "" }
    ]
  }
];

export class MockStorage implements IStorage {
  async getRolesWithUseCases(): Promise<RoleWithUseCases[]> {
    // This class is deprecated - use DatabaseStorage instead
    throw new Error("MockStorage is deprecated. Use DatabaseStorage.");
  }

  async createRole(role: InsertRole): Promise<{ id: number; category: string; name: string; }> {
    throw new Error("MockStorage is deprecated. Use DatabaseStorage.");
  }

  async createUseCase(useCase: InsertUseCase): Promise<any> {
    throw new Error("MockStorage is deprecated. Use DatabaseStorage.");
  }
}

export const storage = new DatabaseStorage();
