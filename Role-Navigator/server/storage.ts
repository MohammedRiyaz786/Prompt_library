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

export const storage = new DatabaseStorage();
