package com.ankamagames.dofus.network.types.game.data.items
{
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class ObjectItemToSellInBid extends ObjectItemToSell implements INetworkType
   {
      
      public static const protocolId:uint = 164;
       
      
      public var unsoldDelay:uint = 0;
      
      public function ObjectItemToSellInBid()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 164;
      }
      
      public function initObjectItemToSellInBid(param1:uint = 0, param2:int = 0, param3:Boolean = false, param4:Vector.<ObjectEffect> = null, param5:uint = 0, param6:uint = 0, param7:uint = 0, param8:uint = 0) : ObjectItemToSellInBid
      {
         super.initObjectItemToSell(param1,param2,param3,param4,param5,param6,param7);
         this.unsoldDelay = param8;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.unsoldDelay = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ObjectItemToSellInBid(param1);
      }
      
      public function serializeAs_ObjectItemToSellInBid(param1:IDataOutput) : void
      {
         super.serializeAs_ObjectItemToSell(param1);
         if(this.unsoldDelay < 0)
         {
            throw new Error("Forbidden value (" + this.unsoldDelay + ") on element unsoldDelay.");
         }
         param1.writeShort(this.unsoldDelay);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectItemToSellInBid(param1);
      }
      
      public function deserializeAs_ObjectItemToSellInBid(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.unsoldDelay = param1.readShort();
         if(this.unsoldDelay < 0)
         {
            throw new Error("Forbidden value (" + this.unsoldDelay + ") on element of ObjectItemToSellInBid.unsoldDelay.");
         }
      }
   }
}
