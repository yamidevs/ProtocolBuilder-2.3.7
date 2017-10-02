package com.ankamagames.dofus.network.types.game.context.roleplay.job
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.interactive.skill.SkillActionDescription;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class JobDescription implements INetworkType
   {
      
      public static const protocolId:uint = 101;
       
      
      public var jobId:uint = 0;
      
      public var skills:Vector.<SkillActionDescription>;
      
      public function JobDescription()
      {
         this.skills = new Vector.<SkillActionDescription>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 101;
      }
      
      public function initJobDescription(param1:uint = 0, param2:Vector.<SkillActionDescription> = null) : JobDescription
      {
         this.jobId = param1;
         this.skills = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.jobId = 0;
         this.skills = new Vector.<SkillActionDescription>();
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_JobDescription(param1);
      }
      
      public function serializeAs_JobDescription(param1:IDataOutput) : void
      {
         if(this.jobId < 0)
         {
            throw new Error("Forbidden value (" + this.jobId + ") on element jobId.");
         }
         param1.writeByte(this.jobId);
         param1.writeShort(this.skills.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.skills.length)
         {
            param1.writeShort((this.skills[_loc2_] as SkillActionDescription).getTypeId());
            (this.skills[_loc2_] as SkillActionDescription).serialize(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_JobDescription(param1);
      }
      
      public function deserializeAs_JobDescription(param1:IDataInput) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:SkillActionDescription = null;
         this.jobId = param1.readByte();
         if(this.jobId < 0)
         {
            throw new Error("Forbidden value (" + this.jobId + ") on element of JobDescription.jobId.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readUnsignedShort();
            _loc5_ = ProtocolTypeManager.getInstance(SkillActionDescription,_loc4_);
            _loc5_.deserialize(param1);
            this.skills.push(_loc5_);
            _loc3_++;
         }
      }
   }
}
