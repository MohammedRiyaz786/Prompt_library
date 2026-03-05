import type { Express } from "express";
import type { Server } from "http";
import { storage } from "./storage";
import { api } from "@shared/routes";

async function seedDatabase() {
  const existingRoles = await storage.getRolesWithUseCases();
  if (existingRoles.length === 0) {
    console.log("Database is empty. Please seed manually if needed.");
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
