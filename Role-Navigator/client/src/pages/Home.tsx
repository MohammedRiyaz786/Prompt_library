import { useState, useMemo, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { useRoles } from "@/hooks/use-roles";
import { useToast } from "@/hooks/use-toast";
import { DirectorySidebar } from "@/components/directory-sidebar";
import { ThemeToggle } from "@/components/theme-toggle";
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Skeleton } from "@/components/ui/skeleton";
import { 
  Search, 
  Terminal, 
  Copy, 
  CheckCheck, 
  Sparkles,
  Command
} from "lucide-react";

export default function Home() {
  const { data: roles = [], isLoading, error } = useRoles();
  const { toast } = useToast();
  
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedRoleId, setSelectedRoleId] = useState<number | null>(null);
  const [selectedUseCaseId, setSelectedUseCaseId] = useState<number | null>(null);
  const [isCopied, setIsCopied] = useState(false);

  // Automatically select the first role when data loads
  useEffect(() => {
    if (roles.length > 0 && !selectedRoleId) {
      setSelectedRoleId(roles[0].id);
    }
  }, [roles, selectedRoleId]);

  const activeRole = useMemo(() => 
    roles.find(r => r.id === selectedRoleId) || null
  , [roles, selectedRoleId]);

  const activeUseCase = useMemo(() => 
    activeRole?.useCases.find(uc => uc.id === selectedUseCaseId) || null
  , [activeRole, selectedUseCaseId]);

  // Handle cross-role searching if needed, but primarily filtering within the active role
  const filteredUseCases = useMemo(() => {
    if (!activeRole) return [];
    if (!searchQuery.trim()) return activeRole.useCases;
    
    const query = searchQuery.toLowerCase();
    return activeRole.useCases.filter(uc => 
      uc.title.toLowerCase().includes(query)
    );
  }, [activeRole, searchQuery]);

  const handleCopyPrompt = async () => {
    if (!activeUseCase) return;
    
    try {
      // Copy the actual prompt template content
      await navigator.clipboard.writeText(activeUseCase.promptTemplate || "");
      setIsCopied(true);
      toast({
        title: "Copied to clipboard",
        description: "The prompt template is ready to use.",
        duration: 2000,
      });
      setTimeout(() => setIsCopied(false), 2000);
    } catch (err) {
      toast({
        variant: "destructive",
        title: "Failed to copy",
        description: "Please try selecting the text manually.",
      });
    }
  };

  const handleRoleSelect = (id: number) => {
    setSelectedRoleId(id);
    setSelectedUseCaseId(null); // Reset use case when switching roles
    setSearchQuery("");
  };

  // Sidebar styling config
  const sidebarStyle = {
    "--sidebar-width": "18rem",
    "--sidebar-width-icon": "4rem",
  } as React.CSSProperties;

  return (
    <SidebarProvider style={sidebarStyle}>
      <div className="flex h-screen w-full bg-background text-foreground overflow-hidden font-sans">
        
        {/* Left Navigation */}
        {isLoading ? (
          <div className="w-[18rem] border-r border-border/50 p-4 space-y-6 flex-shrink-0 bg-sidebar hidden md:block">
            <Skeleton className="h-8 w-3/4 mb-8" />
            <div className="space-y-3">
              <Skeleton className="h-4 w-1/3" />
              <Skeleton className="h-8 w-full" />
              <Skeleton className="h-8 w-full" />
              <Skeleton className="h-8 w-5/6" />
            </div>
            <div className="space-y-3 pt-6">
              <Skeleton className="h-4 w-1/3" />
              <Skeleton className="h-8 w-full" />
              <Skeleton className="h-8 w-4/5" />
            </div>
          </div>
        ) : (
          <DirectorySidebar 
            roles={roles} 
            selectedRoleId={selectedRoleId} 
            onSelectRole={handleRoleSelect} 
          />
        )}

        {/* Main Workspace Area */}
        <div className="flex flex-col flex-1 min-w-0 bg-background/95">
          
          {/* Top Header */}
          <header className="h-14 flex-shrink-0 flex items-center justify-between px-4 border-b border-border/50 bg-background/80 backdrop-blur-md z-10">
            <div className="flex items-center gap-3">
              <SidebarTrigger className="hover-elevate" />
              <div className="w-px h-4 bg-border/80 hidden md:block" />
              
              {/* Breadcrumb style header */}
              <div className="hidden md:flex items-center text-sm">
                <span className="text-muted-foreground">{activeRole?.category || 'Directory'}</span>
                {activeRole && (
                  <>
                    <ChevronRightIcon className="w-3.5 h-3.5 mx-1.5 text-muted-foreground/50" />
                    <span className="font-medium text-foreground">{activeRole.name}</span>
                  </>
                )}
              </div>
            </div>
            
            <div className="flex items-center gap-4">
              <div className="relative hidden sm:block w-64">
                <Search className="absolute left-2.5 top-1/2 -translate-y-1/2 w-4 h-4 text-muted-foreground/70" />
                <Input
                  placeholder="Filter use cases..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-9 h-9 bg-muted/30 border-border/50 focus-visible:ring-1 focus-visible:ring-primary/30 text-sm rounded-full"
                />
              </div>
              <ThemeToggle />
            </div>
          </header>

          {/* Scrollable Content */}
          <main className="flex-1 overflow-y-auto custom-scrollbar">
            <div className="max-w-5xl mx-auto p-4 md:p-8 lg:p-10 space-y-10">
              
              {isLoading ? (
                <div className="space-y-8">
                  <div className="space-y-3">
                    <Skeleton className="h-10 w-1/3" />
                    <Skeleton className="h-4 w-1/2" />
                  </div>
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    {[1, 2, 3, 4, 5, 6].map(i => (
                      <Skeleton key={i} className="h-32 w-full rounded-xl" />
                    ))}
                  </div>
                </div>
              ) : error ? (
                <div className="flex flex-col items-center justify-center py-20 text-center space-y-4">
                  <div className="w-12 h-12 rounded-full bg-destructive/10 flex items-center justify-center">
                    <Terminal className="w-6 h-6 text-destructive" />
                  </div>
                  <h2 className="text-xl font-display font-semibold">Failed to load directory</h2>
                  <p className="text-muted-foreground max-w-sm">There was an error connecting to the server. Please try refreshing the page.</p>
                </div>
              ) : activeRole ? (
                <>
                  {/* Role Header */}
                  <motion.div 
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    className="space-y-3"
                  >
                    <h1 className="text-3xl md:text-4xl font-display font-bold text-foreground tracking-tight">
                      {activeRole.name}
                    </h1>
                    <p className="text-lg text-muted-foreground max-w-2xl leading-relaxed">
                      Select a specific use case below to view and copy the standardized AI prompt structure.
                    </p>
                  </motion.div>

                  {/* Use Cases Grid */}
                  <motion.div 
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    transition={{ delay: 0.1 }}
                    className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4"
                  >
                    {filteredUseCases.length === 0 ? (
                      <div className="col-span-full py-12 text-center border border-dashed border-border/50 rounded-xl bg-muted/10">
                        <p className="text-muted-foreground">No use cases found matching your search.</p>
                      </div>
                    ) : (
                      filteredUseCases.map((uc, idx) => (
                        <motion.div
                          key={uc.id}
                          initial={{ opacity: 0, y: 10 }}
                          animate={{ opacity: 1, y: 0 }}
                          transition={{ delay: 0.1 + (idx * 0.05) }}
                        >
                          <Card 
                            onClick={() => setSelectedUseCaseId(uc.id)}
                            className={`p-5 h-full flex flex-col justify-between cursor-pointer transition-all duration-300 hover-elevate border group ${
                              selectedUseCaseId === uc.id 
                                ? "bg-primary/5 border-primary/30 shadow-[0_0_15px_rgba(var(--primary),0.1)]" 
                                : "bg-card border-border/40 hover:border-border"
                            }`}
                          >
                            <div className="space-y-3">
                              <div className={`w-8 h-8 rounded-lg flex items-center justify-center transition-colors ${
                                selectedUseCaseId === uc.id ? "bg-primary text-primary-foreground" : "bg-muted text-muted-foreground group-hover:text-primary group-hover:bg-primary/10"
                              }`}>
                                <Sparkles className="w-4 h-4" />
                              </div>
                              <h3 className="font-semibold text-foreground leading-snug">
                                {uc.title}
                              </h3>
                            </div>
                            
                            <div className="pt-4 flex items-center text-xs font-medium text-primary opacity-0 group-hover:opacity-100 transition-opacity">
                              View prompt <ChevronRightIcon className="w-3 h-3 ml-1" />
                            </div>
                          </Card>
                        </motion.div>
                      ))
                    )}
                  </motion.div>

                  {/* Prompt Block Revealed Area */}
                  <AnimatePresence mode="wait">
                    {activeUseCase && (
                      <motion.div
                        key={activeUseCase.id}
                        initial={{ opacity: 0, height: 0, y: 20 }}
                        animate={{ opacity: 1, height: "auto", y: 0 }}
                        exit={{ opacity: 0, height: 0, y: -20 }}
                        transition={{ duration: 0.3, ease: "easeOut" }}
                        className="pt-6 pb-20"
                      >
                        <div className="rounded-xl border border-border/60 bg-card overflow-hidden shadow-xl shadow-black/5">
                          {/* Code Block Header */}
                          <div className="flex items-center justify-between px-4 py-3 border-b border-border/50 bg-muted/30">
                            <div className="flex items-center gap-2.5">
                              <Command className="w-4 h-4 text-muted-foreground" />
                              <span className="text-sm font-medium text-muted-foreground">Prompt Template</span>
                              <span className="px-2 py-0.5 rounded-full bg-background border border-border/50 text-[10px] text-muted-foreground font-mono">
                                {activeUseCase.title}
                              </span>
                            </div>
                            
                            <Button 
                              variant="secondary" 
                              size="sm" 
                              className="h-8 text-xs bg-background border border-border/50 hover-elevate transition-all"
                              onClick={handleCopyPrompt}
                            >
                              {isCopied ? (
                                <>
                                  <CheckCheck className="w-3.5 h-3.5 mr-1.5 text-green-500" /> 
                                  <span className="text-green-500">Copied</span>
                                </>
                              ) : (
                                <>
                                  <Copy className="w-3.5 h-3.5 mr-1.5" /> Copy Prompt
                                </>
                              )}
                            </Button>
                          </div>
                          
                          {/* Code Block Content */}
                          <div className="p-6 relative min-h-[350px] bg-background/30 flex flex-col">
                            {/* Line numbers purely for aesthetic developer feel */}
                            <div className="absolute left-0 top-0 bottom-0 w-12 bg-muted/10 border-r border-border/30 hidden sm:flex flex-col items-end py-6 px-3 text-xs text-muted-foreground/30 font-mono select-none">
                              {[...Array(10)].map((_, i) => <span key={i} className="mb-[6px]">{i + 1}</span>)}
                            </div>
                            
                            <textarea
                              className="w-full flex-1 min-h-[300px] resize-none bg-transparent font-mono text-sm sm:text-base leading-relaxed outline-none placeholder:text-muted-foreground/40 text-foreground sm:pl-10"
                              placeholder="// The prompt area is currently empty based on requirements.&#10;// When data is wired up, the template will appear here..."
                              readOnly
                              value={activeUseCase?.promptTemplate || ""}
                            />
                          </div>
                        </div>
                      </motion.div>
                    )}
                  </AnimatePresence>
                </>
              ) : (
                <div className="flex items-center justify-center h-64 text-muted-foreground">
                  No roles available.
                </div>
              )}
            </div>
          </main>
        </div>
      </div>
    </SidebarProvider>
  );
}

// Simple internal icon for layout
function ChevronRightIcon(props: React.ComponentProps<"svg">) {
  return (
    <svg
      {...props}
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path d="m9 18 6-6-6-6" />
    </svg>
  );
}
