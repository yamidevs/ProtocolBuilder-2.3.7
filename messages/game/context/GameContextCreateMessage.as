package com.ankamagames.dofus.network.messages.game.context
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameContextCreateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 200;
       
      
      private var _isInitialized:Boolean = false;
      
      public var context:uint = 1;
      
      public function GameContextCreateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 200;
      }
      
      public function initGameContextCreateMessage(param1:uint = 1) : GameContextCreateMessage
      {
         this.context = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.context = 1;
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
         this.serializeAs_GameContextCreateMessage(param1);
      }
      
      public function serializeAs_GameContextCreateMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.context);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameContextCreateMessage(param1);
      }
      
      public function deserializeAs_GameContextCreateMessage(param1:IDataInput) : void
      {
         this.context = param1.readByte();
         if(this.context < 0)
         {
            throw new Error("Forbidden value (" + this.context + ") on element of GameContextCreateMessage.context.");
         }
      }
   }
}
