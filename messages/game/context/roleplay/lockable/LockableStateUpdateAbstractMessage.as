package com.ankamagames.dofus.network.messages.game.context.roleplay.lockable
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class LockableStateUpdateAbstractMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5671;
       
      
      private var _isInitialized:Boolean = false;
      
      public var locked:Boolean = false;
      
      public function LockableStateUpdateAbstractMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5671;
      }
      
      public function initLockableStateUpdateAbstractMessage(param1:Boolean = false) : LockableStateUpdateAbstractMessage
      {
         this.locked = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.locked = false;
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
         this.serializeAs_LockableStateUpdateAbstractMessage(param1);
      }
      
      public function serializeAs_LockableStateUpdateAbstractMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.locked);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_LockableStateUpdateAbstractMessage(param1);
      }
      
      public function deserializeAs_LockableStateUpdateAbstractMessage(param1:IDataInput) : void
      {
         this.locked = param1.readBoolean();
      }
   }
}
