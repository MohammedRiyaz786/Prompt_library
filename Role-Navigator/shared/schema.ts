import { pgTable, text, serial, integer } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";
import { createInsertSchema } from "drizzle-zod";
import { z } from "zod";

export const roles = pgTable("roles", {
  id: serial("id").primaryKey(),
  category: text("category").notNull(),
  name: text("name").notNull(),
});

export const useCases = pgTable("use_cases", {
  id: serial("id").primaryKey(),
  roleId: integer("role_id").notNull(),
  title: text("title").notNull(),
  promptTemplate: text("prompt_template").notNull().default(""),
});

export const rolesRelations = relations(roles, ({ many }) => ({
  useCases: many(useCases),
}));

export const useCasesRelations = relations(useCases, ({ one }) => ({
  role: one(roles, {
    fields: [useCases.roleId],
    references: [roles.id],
  }),
}));

export const insertRoleSchema = createInsertSchema(roles).omit({ id: true });
export const insertUseCaseSchema = createInsertSchema(useCases).omit({ id: true });

export type Role = typeof roles.$inferSelect;
export type InsertRole = z.infer<typeof insertRoleSchema>;
export type UseCase = typeof useCases.$inferSelect;
export type InsertUseCase = z.infer<typeof insertUseCaseSchema>;

export type RoleWithUseCases = Role & { useCases: UseCase[] };
