package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismWorldInformationRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5985;
       
      
      private var _isInitialized:Boolean = false;
      
      public var join:Boolean = false;
      
      public function PrismWorldInformationRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5985;
      }
      
      public function initPrismWorldInformationRequestMessage(param1:Boolean = false) : PrismWorldInformationRequestMessage
      {
         this.join = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.join = false;
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
         this.serializeAs_PrismWorldInformationRequestMessage(param1);
      }
      
      public function serializeAs_PrismWorldInformationRequestMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.join);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismWorldInformationRequestMessage(param1);
      }
      
      public function deserializeAs_PrismWorldInformationRequestMessage(param1:IDataInput) : void
      {
         this.join = param1.readBoolean();
      }
   }
}
