package com.ankamagames.dofus.network.messages.game.context.notification
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class NotificationByServerMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6103;
       
      
      private var _isInitialized:Boolean = false;
      
      public var id:uint = 0;
      
      public var parameters:Vector.<String>;
      
      public var forceOpen:Boolean = false;
      
      public function NotificationByServerMessage()
      {
         this.parameters = new Vector.<String>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6103;
      }
      
      public function initNotificationByServerMessage(param1:uint = 0, param2:Vector.<String> = null, param3:Boolean = false) : NotificationByServerMessage
      {
         this.id = param1;
         this.parameters = param2;
         this.forceOpen = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.id = 0;
         this.parameters = new Vector.<String>();
         this.forceOpen = false;
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
         this.serializeAs_NotificationByServerMessage(param1);
      }
      
      public function serializeAs_NotificationByServerMessage(param1:IDataOutput) : void
      {
         if(this.id < 0 || this.id > 65535)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeShort(this.id);
         param1.writeShort(this.parameters.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.parameters.length)
         {
            param1.writeUTF(this.parameters[_loc2_]);
            _loc2_++;
         }
         param1.writeBoolean(this.forceOpen);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_NotificationByServerMessage(param1);
      }
      
      public function deserializeAs_NotificationByServerMessage(param1:IDataInput) : void
      {
         var _loc4_:String = null;
         this.id = param1.readUnsignedShort();
         if(this.id < 0 || this.id > 65535)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of NotificationByServerMessage.id.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readUTF();
            this.parameters.push(_loc4_);
            _loc3_++;
         }
         this.forceOpen = param1.readBoolean();
      }
   }
}
