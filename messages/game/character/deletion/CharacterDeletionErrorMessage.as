package com.ankamagames.dofus.network.messages.game.character.deletion
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharacterDeletionErrorMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 166;
       
      
      private var _isInitialized:Boolean = false;
      
      public var reason:uint = 1;
      
      public function CharacterDeletionErrorMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 166;
      }
      
      public function initCharacterDeletionErrorMessage(param1:uint = 1) : CharacterDeletionErrorMessage
      {
         this.reason = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.reason = 1;
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
         this.serializeAs_CharacterDeletionErrorMessage(param1);
      }
      
      public function serializeAs_CharacterDeletionErrorMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.reason);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterDeletionErrorMessage(param1);
      }
      
      public function deserializeAs_CharacterDeletionErrorMessage(param1:IDataInput) : void
      {
         this.reason = param1.readByte();
         if(this.reason < 0)
         {
            throw new Error("Forbidden value (" + this.reason + ") on element of CharacterDeletionErrorMessage.reason.");
         }
      }
   }
}
