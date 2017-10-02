package com.ankamagames.dofus.network.types.game.interactive.skill
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class SkillActionDescriptionTimed extends SkillActionDescription implements INetworkType
   {
      
      public static const protocolId:uint = 103;
       
      
      public var time:uint = 0;
      
      public function SkillActionDescriptionTimed()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 103;
      }
      
      public function initSkillActionDescriptionTimed(param1:uint = 0, param2:uint = 0) : SkillActionDescriptionTimed
      {
         super.initSkillActionDescription(param1);
         this.time = param2;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.time = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_SkillActionDescriptionTimed(param1);
      }
      
      public function serializeAs_SkillActionDescriptionTimed(param1:IDataOutput) : void
      {
         super.serializeAs_SkillActionDescription(param1);
         if(this.time < 0 || this.time > 255)
         {
            throw new Error("Forbidden value (" + this.time + ") on element time.");
         }
         param1.writeByte(this.time);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_SkillActionDescriptionTimed(param1);
      }
      
      public function deserializeAs_SkillActionDescriptionTimed(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.time = param1.readUnsignedByte();
         if(this.time < 0 || this.time > 255)
         {
            throw new Error("Forbidden value (" + this.time + ") on element of SkillActionDescriptionTimed.time.");
         }
      }
   }
}
