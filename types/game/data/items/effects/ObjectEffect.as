package com.ankamagames.dofus.network.types.game.data.items.effects
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ObjectEffect implements INetworkType
   {
      
      public static const protocolId:uint = 76;
       
      
      public var actionId:uint = 0;
      
      public function ObjectEffect()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 76;
      }
      
      public function initObjectEffect(param1:uint = 0) : ObjectEffect
      {
         this.actionId = param1;
         return this;
      }
      
      public function reset() : void
      {
         this.actionId = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ObjectEffect(param1);
      }
      
      public function serializeAs_ObjectEffect(param1:IDataOutput) : void
      {
         if(this.actionId < 0)
         {
            throw new Error("Forbidden value (" + this.actionId + ") on element actionId.");
         }
         param1.writeShort(this.actionId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectEffect(param1);
      }
      
      public function deserializeAs_ObjectEffect(param1:IDataInput) : void
      {
         this.actionId = param1.readShort();
         if(this.actionId < 0)
         {
            throw new Error("Forbidden value (" + this.actionId + ") on element of ObjectEffect.actionId.");
         }
      }
   }
}
