package com.ankamagames.dofus.network.types.game.context.fight
{
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.BooleanByteWrapper;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class FightResultExperienceData extends FightResultAdditionalData implements INetworkType
   {
      
      public static const protocolId:uint = 192;
       
      
      public var experience:Number = 0;
      
      public var showExperience:Boolean = false;
      
      public var experienceLevelFloor:Number = 0;
      
      public var showExperienceLevelFloor:Boolean = false;
      
      public var experienceNextLevelFloor:Number = 0;
      
      public var showExperienceNextLevelFloor:Boolean = false;
      
      public var experienceFightDelta:int = 0;
      
      public var showExperienceFightDelta:Boolean = false;
      
      public var experienceForGuild:uint = 0;
      
      public var showExperienceForGuild:Boolean = false;
      
      public var experienceForMount:uint = 0;
      
      public var showExperienceForMount:Boolean = false;
      
      public var isIncarnationExperience:Boolean = false;
      
      public function FightResultExperienceData()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 192;
      }
      
      public function initFightResultExperienceData(param1:Number = 0, param2:Boolean = false, param3:Number = 0, param4:Boolean = false, param5:Number = 0, param6:Boolean = false, param7:int = 0, param8:Boolean = false, param9:uint = 0, param10:Boolean = false, param11:uint = 0, param12:Boolean = false, param13:Boolean = false) : FightResultExperienceData
      {
         this.experience = param1;
         this.showExperience = param2;
         this.experienceLevelFloor = param3;
         this.showExperienceLevelFloor = param4;
         this.experienceNextLevelFloor = param5;
         this.showExperienceNextLevelFloor = param6;
         this.experienceFightDelta = param7;
         this.showExperienceFightDelta = param8;
         this.experienceForGuild = param9;
         this.showExperienceForGuild = param10;
         this.experienceForMount = param11;
         this.showExperienceForMount = param12;
         this.isIncarnationExperience = param13;
         return this;
      }
      
      override public function reset() : void
      {
         this.experience = 0;
         this.showExperience = false;
         this.experienceLevelFloor = 0;
         this.showExperienceLevelFloor = false;
         this.experienceNextLevelFloor = 0;
         this.showExperienceNextLevelFloor = false;
         this.experienceFightDelta = 0;
         this.showExperienceFightDelta = false;
         this.experienceForGuild = 0;
         this.showExperienceForGuild = false;
         this.experienceForMount = 0;
         this.showExperienceForMount = false;
         this.isIncarnationExperience = false;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FightResultExperienceData(param1);
      }
      
      public function serializeAs_FightResultExperienceData(param1:IDataOutput) : void
      {
         super.serializeAs_FightResultAdditionalData(param1);
         var _loc2_:uint = 0;
         BooleanByteWrapper.setFlag(_loc2_,0,this.showExperience);
         BooleanByteWrapper.setFlag(_loc2_,1,this.showExperienceLevelFloor);
         BooleanByteWrapper.setFlag(_loc2_,2,this.showExperienceNextLevelFloor);
         BooleanByteWrapper.setFlag(_loc2_,3,this.showExperienceFightDelta);
         BooleanByteWrapper.setFlag(_loc2_,4,this.showExperienceForGuild);
         BooleanByteWrapper.setFlag(_loc2_,5,this.showExperienceForMount);
         BooleanByteWrapper.setFlag(_loc2_,6,this.isIncarnationExperience);
         param1.writeByte(_loc2_);
         if(this.experience < 0)
         {
            throw new Error("Forbidden value (" + this.experience + ") on element experience.");
         }
         param1.writeDouble(this.experience);
         if(this.experienceLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.experienceLevelFloor + ") on element experienceLevelFloor.");
         }
         param1.writeDouble(this.experienceLevelFloor);
         if(this.experienceNextLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.experienceNextLevelFloor + ") on element experienceNextLevelFloor.");
         }
         param1.writeDouble(this.experienceNextLevelFloor);
         param1.writeInt(this.experienceFightDelta);
         if(this.experienceForGuild < 0)
         {
            throw new Error("Forbidden value (" + this.experienceForGuild + ") on element experienceForGuild.");
         }
         param1.writeInt(this.experienceForGuild);
         if(this.experienceForMount < 0)
         {
            throw new Error("Forbidden value (" + this.experienceForMount + ") on element experienceForMount.");
         }
         param1.writeInt(this.experienceForMount);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FightResultExperienceData(param1);
      }
      
      public function deserializeAs_FightResultExperienceData(param1:IDataInput) : void
      {
         super.deserialize(param1);
         var _loc2_:uint = param1.readByte();
         this.showExperience = BooleanByteWrapper.getFlag(_loc2_,0);
         this.showExperienceLevelFloor = BooleanByteWrapper.getFlag(_loc2_,1);
         this.showExperienceNextLevelFloor = BooleanByteWrapper.getFlag(_loc2_,2);
         this.showExperienceFightDelta = BooleanByteWrapper.getFlag(_loc2_,3);
         this.showExperienceForGuild = BooleanByteWrapper.getFlag(_loc2_,4);
         this.showExperienceForMount = BooleanByteWrapper.getFlag(_loc2_,5);
         this.isIncarnationExperience = BooleanByteWrapper.getFlag(_loc2_,6);
         this.experience = param1.readDouble();
         if(this.experience < 0)
         {
            throw new Error("Forbidden value (" + this.experience + ") on element of FightResultExperienceData.experience.");
         }
         this.experienceLevelFloor = param1.readDouble();
         if(this.experienceLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.experienceLevelFloor + ") on element of FightResultExperienceData.experienceLevelFloor.");
         }
         this.experienceNextLevelFloor = param1.readDouble();
         if(this.experienceNextLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.experienceNextLevelFloor + ") on element of FightResultExperienceData.experienceNextLevelFloor.");
         }
         this.experienceFightDelta = param1.readInt();
         this.experienceForGuild = param1.readInt();
         if(this.experienceForGuild < 0)
         {
            throw new Error("Forbidden value (" + this.experienceForGuild + ") on element of FightResultExperienceData.experienceForGuild.");
         }
         this.experienceForMount = param1.readInt();
         if(this.experienceForMount < 0)
         {
            throw new Error("Forbidden value (" + this.experienceForMount + ") on element of FightResultExperienceData.experienceForMount.");
         }
      }
   }
}
