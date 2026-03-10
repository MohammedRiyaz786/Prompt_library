import { useMemo } from "react";
import { Layers, Briefcase, ChevronRight } from "lucide-react";
import { type RoleWithUseCases } from "@shared/schema";
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from "@/components/ui/sidebar";

interface DirectorySidebarProps {
  roles: RoleWithUseCases[];
  selectedRoleId: number | null;
  onSelectRole: (id: number) => void;
}

export function DirectorySidebar({ roles, selectedRoleId, onSelectRole }: DirectorySidebarProps) {
  // Group roles by category and maintain order
  const categories = useMemo(() => {
    const groups: Record<string, { roles: RoleWithUseCases[]; minId: number }> = {};
    roles.forEach((role) => {
      const category = role.category || "Uncategorized";
      if (!groups[category]) {
        groups[category] = { roles: [], minId: role.id };
      }
      groups[category].roles.push(role);
      groups[category].minId = Math.min(groups[category].minId, role.id);
    });

    // Return categories sorted by their minimum role ID
    return Object.entries(groups)
      .sort(([, a], [, b]) => a.minId - b.minId)
      .map(([name, data]) => ({ name, roles: data.roles.sort((a, b) => a.id - b.id) }));
  }, [roles]);

  return (
    <Sidebar className="border-r border-border/50">
      <SidebarHeader className="h-14 flex items-center px-4 border-b border-border/50 bg-background/50">
        <div className="flex items-center gap-2 font-display font-semibold text-foreground">
          <div className="w-6 h-6 rounded-md bg-primary/10 flex items-center justify-center text-primary">
            <Layers className="w-3.5 h-3.5" />
          </div>
          Tx Prompt Library
        </div>
      </SidebarHeader>

      <SidebarContent className="custom-scrollbar py-2">
        {categories.map(({ name: category, roles: categoryRoles }) => (
          <SidebarGroup key={category}>
            <SidebarGroupLabel className="text-xs font-medium text-muted-foreground uppercase tracking-wider mb-2">
              {category}
            </SidebarGroupLabel>
            <SidebarGroupContent>
              <SidebarMenu>
                {categoryRoles.map((role: RoleWithUseCases) => {
                  const isActive = role.id === selectedRoleId;
                  return (
                    <SidebarMenuItem key={role.id}>
                      <SidebarMenuButton
                        isActive={isActive}
                        onClick={() => onSelectRole(role.id)}
                        className={`cursor-pointer transition-colors group ${isActive ? "bg-primary/5 text-primary hover:bg-primary/10" : "text-muted-foreground hover:text-foreground"
                          }`}
                      >
                        <Briefcase className={`w-4 h-4 mr-2 ${isActive ? "text-primary" : "text-muted-foreground group-hover:text-foreground"}`} />
                        <span className="flex-1 truncate">{role.name}</span>
                        {isActive && (
                          <ChevronRight className="w-3.5 h-3.5 opacity-50" />
                        )}
                      </SidebarMenuButton>
                    </SidebarMenuItem>
                  );
                })}
              </SidebarMenu>
            </SidebarGroupContent>
          </SidebarGroup>
        ))}
      </SidebarContent>
    </Sidebar>
  );
}
