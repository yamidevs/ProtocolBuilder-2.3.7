package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.dofus.network.messages.game.dialog.LeaveDialogMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeLeaveMessage extends LeaveDialogMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5628;
       
      
      private var _isInitialized:Boolean = false;
      
      public var success:Boolean = false;
      
      public function ExchangeLeaveMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5628;
      }
      
      public function initExchangeLeaveMessage(param1:Boolean = false) : ExchangeLeaveMessage
      {
         this.success = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.success = false;
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
         this.serializeAs_ExchangeLeaveMessage(param1);
      }
      
      public function serializeAs_ExchangeLeaveMessage(param1:IDataOutput) : void
      {
         super.serializeAs_LeaveDialogMessage(param1);
         param1.writeBoolean(this.success);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeLeaveMessage(param1);
      }
      
      public function deserializeAs_ExchangeLeaveMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.success = param1.readBoolean();
      }
   }
}
