package com.ankamagames.dofus.network.messages.connection
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class HelloConnectMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 3;
       
      
      private var _isInitialized:Boolean = false;
      
      public var connectionType:uint = 1;
      
      [Transient]
      public var key:String = "";
      
      public function HelloConnectMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 3;
      }
      
      public function initHelloConnectMessage(param1:uint = 1, param2:String = "") : HelloConnectMessage
      {
         this.connectionType = param1;
         this.key = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.connectionType = 1;
         this.key = "";
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
         this.serializeAs_HelloConnectMessage(param1);
      }
      
      public function serializeAs_HelloConnectMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.connectionType);
         param1.writeUTF(this.key);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_HelloConnectMessage(param1);
      }
      
      public function deserializeAs_HelloConnectMessage(param1:IDataInput) : void
      {
         this.connectionType = param1.readByte();
         if(this.connectionType < 0)
         {
            throw new Error("Forbidden value (" + this.connectionType + ") on element of HelloConnectMessage.connectionType.");
         }
         this.key = param1.readUTF();
      }
   }
}
