from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from pydantic import BaseModel, ConfigDict

from .database import get_db
from .models import Role, UseCase

app = FastAPI()

# Pydantic schemas for API response matching the existing structure
class UseCaseSchema(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    roleId: int
    title: str
    promptTemplate: Optional[str]

class RoleWithUseCasesSchema(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: int
    category: str
    name: str
    useCases: List[UseCaseSchema]

@app.get("/api/roles", response_model=List[RoleWithUseCasesSchema])
def get_roles_with_use_cases(db: Session = Depends(get_db)):
    # Query all roles and their associated use cases
    roles = db.query(Role).all()
    # Map SQLAlchemy objects to include frontend-compatible property names
    for role in roles:
        # Create a list of use case dicts with correct keys
        role.useCases = []
        for uc in role.use_cases:
            role.useCases.append({
                "id": uc.id,
                "roleId": uc.role_id,
                "title": uc.title,
                "promptTemplate": uc.prompt_template
            })
    return roles

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
