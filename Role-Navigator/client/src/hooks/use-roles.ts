import { useQuery } from "@tanstack/react-query";
import { api } from "@shared/routes";
import { type RoleWithUseCases } from "@shared/schema";
import { z } from "zod";

// Helper function to safely parse and log Zod schema errors
function parseWithLogging<T>(schema: z.ZodSchema<T>, data: unknown, label: string): T {
  const result = schema.safeParse(data);
  if (!result.success) {
    console.error(`[Zod Validation Error] ${label}:`, result.error.format());
    throw new Error(`Data validation failed for ${label}`);
  }
  return result.data;
}

export function useRoles() {
  return useQuery({
    queryKey: [api.roles.list.path],
    queryFn: async () => {
      const res = await fetch(api.roles.list.path, {
        method: api.roles.list.method,
        credentials: "include"
      });
      
      if (!res.ok) {
        throw new Error("Failed to fetch roles directory");
      }
      
      const data = await res.json();
      return parseWithLogging(api.roles.list.responses[200], data, "roles.list");
    },
  });
}
