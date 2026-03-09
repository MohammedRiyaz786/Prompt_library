from sqlalchemy import Column, Integer, Text, ForeignKey
from sqlalchemy.orm import relationship
from .database import Base

class Role(Base):
    __tablename__ = "roles"
    id = Column(Integer, primary_key=True, index=True)
    category = Column(Text, nullable=False)
    name = Column(Text, nullable=False)
    
    use_cases = relationship("UseCase", back_populates="role")

class UseCase(Base):
    __tablename__ = "use_cases"
    id = Column(Integer, primary_key=True, index=True)
    role_id = Column(Integer, ForeignKey("roles.id"), nullable=False)
    title = Column(Text, nullable=False)
    prompt_template = Column(Text)
    
    role = relationship("Role", back_populates="use_cases")
