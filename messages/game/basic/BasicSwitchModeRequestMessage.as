package com.ankamagames.dofus.network.messages.game.basic
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class BasicSwitchModeRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6101;
       
      
      private var _isInitialized:Boolean = false;
      
      public var mode:int = 0;
      
      public function BasicSwitchModeRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6101;
      }
      
      public function initBasicSwitchModeRequestMessage(param1:int = 0) : BasicSwitchModeRequestMessage
      {
         this.mode = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.mode = 0;
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
         this.serializeAs_BasicSwitchModeRequestMessage(param1);
      }
      
      public function serializeAs_BasicSwitchModeRequestMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.mode);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_BasicSwitchModeRequestMessage(param1);
      }
      
      public function deserializeAs_BasicSwitchModeRequestMessage(param1:IDataInput) : void
      {
         this.mode = param1.readByte();
      }
   }
}
