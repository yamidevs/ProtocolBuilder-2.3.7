package com.ankamagames.dofus.network.messages.game.context.roleplay.lockable
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class LockableCodeResultMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5672;
       
      
      private var _isInitialized:Boolean = false;
      
      public var success:Boolean = false;
      
      public function LockableCodeResultMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5672;
      }
      
      public function initLockableCodeResultMessage(param1:Boolean = false) : LockableCodeResultMessage
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
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_LockableCodeResultMessage(param1);
      }
      
      public function serializeAs_LockableCodeResultMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.success);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_LockableCodeResultMessage(param1);
      }
      
      public function deserializeAs_LockableCodeResultMessage(param1:IDataInput) : void
      {
         this.success = param1.readBoolean();
      }
   }
}
