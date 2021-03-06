package com.ankamagames.dofus.network.messages.game.inventory.items
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class InventoryWeightMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 3009;
       
      
      private var _isInitialized:Boolean = false;
      
      public var weight:uint = 0;
      
      public var weightMax:uint = 0;
      
      public function InventoryWeightMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 3009;
      }
      
      public function initInventoryWeightMessage(param1:uint = 0, param2:uint = 0) : InventoryWeightMessage
      {
         this.weight = param1;
         this.weightMax = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.weight = 0;
         this.weightMax = 0;
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_InventoryWeightMessage(param1);
      }
      
      public function serializeAs_InventoryWeightMessage(param1:IDataOutput) : void
      {
         if(this.weight < 0)
         {
            throw new Error("Forbidden value (" + this.weight + ") on element weight.");
         }
         param1.writeInt(this.weight);
         if(this.weightMax < 0)
         {
            throw new Error("Forbidden value (" + this.weightMax + ") on element weightMax.");
         }
         param1.writeInt(this.weightMax);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_InventoryWeightMessage(param1);
      }
      
      public function deserializeAs_InventoryWeightMessage(param1:IDataInput) : void
      {
         this.weight = param1.readInt();
         if(this.weight < 0)
         {
            throw new Error("Forbidden value (" + this.weight + ") on element of InventoryWeightMessage.weight.");
         }
         this.weightMax = param1.readInt();
         if(this.weightMax < 0)
         {
            throw new Error("Forbidden value (" + this.weightMax + ") on element of InventoryWeightMessage.weightMax.");
         }
      }
   }
}
