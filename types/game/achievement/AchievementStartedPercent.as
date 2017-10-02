package com.ankamagames.dofus.network.types.game.achievement
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AchievementStartedPercent extends Achievement implements INetworkType
   {
      
      public static const protocolId:uint = 362;
       
      
      public var completionPercent:uint = 0;
      
      public function AchievementStartedPercent()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 362;
      }
      
      public function initAchievementStartedPercent(param1:uint = 0, param2:uint = 0) : AchievementStartedPercent
      {
         super.initAchievement(param1);
         this.completionPercent = param2;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.completionPercent = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_AchievementStartedPercent(param1);
      }
      
      public function serializeAs_AchievementStartedPercent(param1:IDataOutput) : void
      {
         super.serializeAs_Achievement(param1);
         if(this.completionPercent < 0)
         {
            throw new Error("Forbidden value (" + this.completionPercent + ") on element completionPercent.");
         }
         param1.writeByte(this.completionPercent);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AchievementStartedPercent(param1);
      }
      
      public function deserializeAs_AchievementStartedPercent(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.completionPercent = param1.readByte();
         if(this.completionPercent < 0)
         {
            throw new Error("Forbidden value (" + this.completionPercent + ") on element of AchievementStartedPercent.completionPercent.");
         }
      }
   }
}
