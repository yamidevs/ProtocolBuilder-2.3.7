package com.ankamagames.dofus.network.messages.game.context.roleplay.lockable
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class LockableUseCodeMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5667;
       
      
      private var _isInitialized:Boolean = false;
      
      public var code:String = "";
      
      public function LockableUseCodeMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5667;
      }
      
      public function initLockableUseCodeMessage(param1:String = "") : LockableUseCodeMessage
      {
         this.code = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.code = "";
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
         this.serializeAs_LockableUseCodeMessage(param1);
      }
      
      public function serializeAs_LockableUseCodeMessage(param1:IDataOutput) : void
      {
         param1.writeUTF(this.code);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_LockableUseCodeMessage(param1);
      }
      
      public function deserializeAs_LockableUseCodeMessage(param1:IDataInput) : void
      {
         this.code = param1.readUTF();
      }
   }
}
