package com.ankamagames.dofus.network.types.game.achievement
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class Achievement implements INetworkType
   {
      
      public static const protocolId:uint = 363;
       
      
      public var id:uint = 0;
      
      public function Achievement()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 363;
      }
      
      public function initAchievement(param1:uint = 0) : Achievement
      {
         this.id = param1;
         return this;
      }
      
      public function reset() : void
      {
         this.id = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_Achievement(param1);
      }
      
      public function serializeAs_Achievement(param1:IDataOutput) : void
      {
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeShort(this.id);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_Achievement(param1);
      }
      
      public function deserializeAs_Achievement(param1:IDataInput) : void
      {
         this.id = param1.readShort();
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of Achievement.id.");
         }
      }
   }
}
