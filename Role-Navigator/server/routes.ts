import type { Express } from "express";
import type { Server } from "http";
import { storage } from "./storage";
import { api } from "@shared/routes";

const seedData = [
  {
    category: "Executive and Leadership Roles",
    roles: [
      {
        name: "Engineering Manager / Technical Director",
        useCases: [
          "Technical design guidance",
          "Team performance summaries",
          "Architecture review prompts",
          "Resource planning assistance"
        ]
      }
    ]
  },
  {
    category: "Product and Project Roles",
    roles: [
      {
        name: "Product Manager",
        useCases: [
          "Product requirement generation",
          "User story creation",
          "Acceptance criteria drafting",
          "Feature prioritization support"
        ]
      },
      {
        name: "Business Analyst",
        useCases: [
          "Requirement documentation templates",
          "Process mapping assistance",
          "Gap analysis prompts",
          "Data interpretation summaries"
        ]
      },
      {
        name: "Project Manager",
        useCases: [
          "Project plan drafting",
          "Risk management templates",
          "Sprint planning support",
          "Stakeholder communication drafts"
        ]
      }
    ]
  },
  {
    category: "Engineering and Development Roles",
    roles: [
      {
        name: "Software Engineer (Frontend / Backend / Full Stack)",
        useCases: [
          "Code generation",
          "Architecture design guidance",
          "API design prompts",
          "Debugging and optimization support"
        ]
      },
      {
        name: "Technical Lead",
        useCases: [
          "Code review summaries",
          "Best practice recommendations",
          "Design pattern suggestions",
          "Technical mentoring guidance"
        ]
      },
      {
        name: "DevOps / Site Reliability Engineer",
        useCases: [
          "CI/CD pipeline templates",
          "Infrastructure as Code examples",
          "Monitoring configuration prompts",
          "Reliability and incident analysis"
        ]
      }
    ]
  },
  {
    category: "Quality and Testing Roles",
    roles: [
      {
        name: "QA Engineer / Tester",
        useCases: [
          "Test Case Generation from User Story",
          "Bug Report Drafting",
          "Test strategy documentation",
          "Regression Suite Prioritization"
        ]
      },
      {
        name: "Automation Test Engineer",
        useCases: [
          "Automation script generation",
          "Framework design prompts",
          "CI integration guidance"
        ]
      },
      {
        name: "SDET",
        useCases: [
          "Advanced test scenario design",
          "Test data generation",
          "Automation infrastructure setup",
          "Mobile Accessibility Audit Report"
        ]
      },
      {
        name: "Test Architect",
        useCases: [
          "Testing strategy design",
          "Tool evaluation support",
          "Quality metrics definition"
        ]
      },
      {
        name: "QA Lead / Test Manager",
        useCases: [
          "Test planning documentation",
          "Quality KPI reports",
          "Process improvement recommendations",
          "UAT Sign-off Report"
        ]
      }
    ]
  },
  {
    category: "Documentation and Support Roles",
    roles: [
      {
        name: "Technical Writer",
        useCases: [
          "API documentation templates",
          "User manual drafting",
          "Release notes creation",
          "Standard operating procedures"
        ]
      },
      {
        name: "Technical Support (L1/L2/L3)",
        useCases: [
          "Troubleshooting guides",
          "Customer response templates",
          "Root cause analysis summaries"
        ]
      }
    ]
  },
  {
    category: "Other Cross Functional Roles",
    roles: [
      {
        name: "UX/UI Designer",
        useCases: [
          "Design critique prompts",
          "UI specification drafting",
          "User experience analysis"
        ]
      },
      {
        name: "Data Engineer",
        useCases: [
          "ETL pipeline prompts",
          "Schema design support",
          "Data optimization guidance"
        ]
      },
      {
        name: "Data Scientist",
        useCases: [
          "Model experimentation guidance",
          "Data analysis prompts",
          "Insight generation support"
        ]
      },
      {
        name: "Security Engineer",
        useCases: [
          "Threat analysis prompts",
          "Secure coding guidelines",
          "Vulnerability assessment support"
        ]
      }
    ]
  }
];

async function seedDatabase() {
  const existingRoles = await storage.getRolesWithUseCases();
  if (existingRoles.length === 0) {
    console.log("Seeding database with roles and use cases...");
    for (const cat of seedData) {
      for (const roleData of cat.roles) {
        const role = await storage.createRole({
          category: cat.category,
          name: roleData.name,
        });
        
        for (const useCaseTitle of roleData.useCases) {
          let promptTemplate = "";
          
          // Add exact prompt content for QA roles
          if (cat.category === "Quality and Testing Roles" && roleData.name === "QA Engineer / Tester") {
            if (useCaseTitle === "Test Case Generation from User Story") {
              promptTemplate = "ROLE:\nYou are a senior QA Engineer specializing in Native iOS and Android mobile application testing.\n\nCONTEXT:\nProject: [Project Name]\nStory Title: [Story Title]\nStory ID: [JIRA ID]\nPlatform: iOS | Android | Both\nBuild Version: [Version Number or \"Not yet available\"]\nTesting Type: Functional | Regression | Smoke | Exploratory\n\nTASK:\nGenerate exhaustive test cases for the user story and acceptance criteria provided below.\nYou MUST evaluate ALL of the following categories — do not skip any:\n  - Happy path (primary success flow)\n  - Negative / error paths (invalid input, wrong state, network failure)\n  - Edge cases (boundary values, empty states, maximum limits)\n  - Platform-specific behavior (iOS vs Android differences)\n  - Accessibility (screen reader, font scaling, contrast)\n\nEach test case must be fully independent and executable without referencing another test case.\nEvaluate the ENTIRE story and ALL acceptance criteria before writing any test case.\nDo NOT skip negative or edge case scenarios — these are as important as happy path.\n\nUSER STORY & ACCEPTANCE CRITERIA:\n[Paste story and AC here]\n\nCONSTRAINTS:\n- Test cases must be written so a junior tester can execute them without clarification\n- All preconditions must be listed explicitly — assume nothing\n- Platform differences between iOS and Android must be called out in their own test cases\n- Do not group multiple verifications into one expected result — one check per test case\n\nOUTPUT FORMAT:\nTEST CASE [N]:\nTitle: [Short descriptive title]\nType: Happy Path | Negative | Edge Case | Accessibility | Platform-Specific\nPlatform: iOS | Android | Both\nPreconditions:\n  - [Setup requirement 1]\n  - [Setup requirement 2]\nSteps:\n  1. [Step]\n  2. [Step]\n  3. [Step]\nExpected Result: [Exact, observable outcome]\nNotes: [iOS/Android difference, known risk, or \"None\"]\n\n---\n(repeat for every test case)\n\nSUMMARY:\nTotal Test Cases: [N]\nHappy Path: [N] | Negative: [N] | Edge Case: [N] | Accessibility: [N] | Platform-Specific: [N]\nCoverage Gaps: [Topics not covered due to missing AC — or \"None\"]";
            } else if (useCaseTitle === "Bug Report Drafting") {
              promptTemplate = "ROLE:\nYou are a QA Engineer writing a formal bug report for a Native iOS/Android mobile application.\n\nCONTEXT:\nProject: [Project Name]\nApp Version: [Version]\nDevice Model: [e.g., iPhone 15 Pro | Samsung Galaxy S24]\nOS Version: [e.g., iOS 17.4 | Android 14]\nEnvironment: Dev | QA | Staging | Production\nBuild Number: [Build #]\n\nTASK:\nUsing the raw observation below, produce a complete, developer-ready bug report.\nSteps to reproduce must be precise enough for a developer to replicate on first attempt.\nClassify severity and priority independently — a cosmetic bug can be high priority\nif it affects a release deadline.\nIf information needed to complete a field is missing, mark it [NEEDS CAPTURE] — never leave blank.\n\nRAW OBSERVATION:\n[Describe what you saw — can be informal]\n\nCONSTRAINTS:\n- Steps to reproduce must be numbered and atomic — one action per step, never compound\n- Do not include opinion or blame — only observable, factual statements\n- Actual Result must describe exactly what happened, not what you think caused it\n- Reproducibility must be based on actual attempts — do not guess\n\nOUTPUT FORMAT:\nBUG REPORT\nTitle: [Clear searchable title — what broke + where + on what platform]\nSeverity: Critical | High | Medium | Low\nPriority: High | Medium | Low\nPlatform: iOS | Android | Both\nStatus: New\n\nEnvironment:\n  App Version: [Version] | Build: [#] | Device: [Model] | OS: [Version] | Env: [Dev/QA/Staging/Prod]\n\nSteps to Reproduce:\n  1. [Step]\n  2. [Step]\n  3. [Step]\n  ...\n\nExpected Result: [What should have happened]\nActual Result: [What actually happened — observable fact only]\nReproducibility: Always | Intermittent ([N] of [N] attempts) | Once\n\nAttachments: [Screenshot / Video / Logs — or \"Pending capture\"]\nWorkaround: [Known workaround if any — or \"None\"]\nRelated Tickets: [Linked JIRA IDs — or \"None\"]\nNotes: [Any additional context — or \"None\"]";
            } else if (useCaseTitle === "Regression Suite Prioritization") {
              promptTemplate = "ROLE:\nYou are a senior QA Engineer prioritizing a regression test suite for a\nNative iOS/Android mobile application release.\n\nCONTEXT:\nProject: [Project Name]\nRelease Version: [Version]\nPlatform: iOS | Android | Both\nRelease Type: Major | Minor | Hotfix | Patch\nTime Available for Regression: [e.g., 2 days | 1 sprint | 4 hours]\nRelease Date: [DD/MM/YYYY]\n\nTASK:\nUsing the release scope and existing test suite provided below, prioritize regression\ntests into three tiers: Must Run, Should Run, and Can Skip.\nBase prioritization on: areas changed in this release, user-facing critical paths,\nhistorical defect hotspots, and platform-specific risks.\nEvaluate the ENTIRE test suite before assigning tiers — do not assign on first pass.\nFlag any area of the app changed in this release that has NO regression test coverage.\n\nRELEASE SCOPE (stories/changes in this release):\n[Paste list of stories, PRs, or change descriptions here]\n\nEXISTING REGRESSION TEST SUITE:\n[Paste test case IDs, titles, and areas they cover]\n\nHISTORICAL DEFECT AREAS (if known):\n[Paste known bug-prone areas or \"Not available\"]\n\nCONSTRAINTS:\n- Must Run tier must be executable within the time available stated above\n- Do not assign Must Run to tests unrelated to this release's changes\n- Every changed area must have at least one Must Run test — flag if it doesn't\n- Platform-specific tests must be tiered separately for iOS and Android\n\nOUTPUT FORMAT:\nREGRESSION PRIORITIZATION REPORT\nRelease: [Version] | Platform: [iOS/Android/Both] | Time Budget: [X days/hours]\nGenerated: [DD/MM/YYYY]\n\n🔴 MUST RUN ([N] tests — Est. [X hours]):\n| Test ID | Test Title | Area | Platform | Reason for Priority |\n|---|---|---|---|---|\n| TC-001 | [Title] | [Feature area] | iOS | [Changed in this release] |\n\n🟡 SHOULD RUN IF TIME PERMITS ([N] tests — Est. [X hours]):\n| Test ID | Test Title | Area | Platform | Reason |\n|---|---|---|---|---|\n\n🟢 CAN SKIP THIS RELEASE ([N] tests):\n| Test ID | Test Title | Reason for Skip |\n|---|---|---|\n\nCOVERAGE GAPS (changed areas with no regression test):\n| Changed Area | Story ID | Risk | Recommendation |\n|---|---|---|---|\n| [Area] | [ID] | High/Med/Low | [Create new test / Manual exploratory] |\n\nSUMMARY:\nTotal Suite Size: [N] | Must Run: [N] | Should Run: [N] | Skipped: [N]\nEstimated Must Run Duration: [X hours] | Fits Time Budget: Yes | No";
            }
          }
          
          await storage.createUseCase({
            roleId: role.id,
            title: useCaseTitle,
            promptTemplate: promptTemplate,
          });
        }
      }
    }
    console.log("Seeding complete!");
  }
}

export async function registerRoutes(
  httpServer: Server,
  app: Express
): Promise<Server> {
  // Try to seed on startup
  seedDatabase().catch(err => console.error("Failed to seed db:", err));

  app.get(api.roles.list.path, async (req, res) => {
    try {
      const data = await storage.getRolesWithUseCases();
      res.status(200).json(data);
    } catch (err) {
      console.error(err);
      res.status(500).json({ message: "Failed to fetch roles" });
    }
  });

  return httpServer;
}
