package com.ankamagames.dofus.network.messages.game.context.roleplay.houses
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class HouseSellFromInsideRequestMessage extends HouseSellRequestMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5884;
       
      
      private var _isInitialized:Boolean = false;
      
      public function HouseSellFromInsideRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5884;
      }
      
      public function initHouseSellFromInsideRequestMessage(param1:uint = 0) : HouseSellFromInsideRequestMessage
      {
         super.initHouseSellRequestMessage(param1);
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_HouseSellFromInsideRequestMessage(param1);
      }
      
      public function serializeAs_HouseSellFromInsideRequestMessage(param1:IDataOutput) : void
      {
         super.serializeAs_HouseSellRequestMessage(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_HouseSellFromInsideRequestMessage(param1);
      }
      
      public function deserializeAs_HouseSellFromInsideRequestMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
      }
   }
}
