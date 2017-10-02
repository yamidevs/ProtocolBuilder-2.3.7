package com.ankamagames.dofus.network.messages.game.inventory.preset
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class InventoryPresetSaveResultMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6170;
       
      
      private var _isInitialized:Boolean = false;
      
      public var presetId:uint = 0;
      
      public var code:uint = 2;
      
      public function InventoryPresetSaveResultMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6170;
      }
      
      public function initInventoryPresetSaveResultMessage(param1:uint = 0, param2:uint = 2) : InventoryPresetSaveResultMessage
      {
         this.presetId = param1;
         this.code = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.presetId = 0;
         this.code = 2;
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
         this.serializeAs_InventoryPresetSaveResultMessage(param1);
      }
      
      public function serializeAs_InventoryPresetSaveResultMessage(param1:IDataOutput) : void
      {
         if(this.presetId < 0)
         {
            throw new Error("Forbidden value (" + this.presetId + ") on element presetId.");
         }
         param1.writeByte(this.presetId);
         param1.writeByte(this.code);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_InventoryPresetSaveResultMessage(param1);
      }
      
      public function deserializeAs_InventoryPresetSaveResultMessage(param1:IDataInput) : void
      {
         this.presetId = param1.readByte();
         if(this.presetId < 0)
         {
            throw new Error("Forbidden value (" + this.presetId + ") on element of InventoryPresetSaveResultMessage.presetId.");
         }
         this.code = param1.readByte();
         if(this.code < 0)
         {
            throw new Error("Forbidden value (" + this.code + ") on element of InventoryPresetSaveResultMessage.code.");
         }
      }
   }
}
