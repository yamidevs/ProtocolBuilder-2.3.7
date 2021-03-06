package com.ankamagames.dofus.network.messages.game.character.creation
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharacterCreationResultMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 161;
       
      
      private var _isInitialized:Boolean = false;
      
      public var result:uint = 1;
      
      public function CharacterCreationResultMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 161;
      }
      
      public function initCharacterCreationResultMessage(param1:uint = 1) : CharacterCreationResultMessage
      {
         this.result = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.result = 1;
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
         this.serializeAs_CharacterCreationResultMessage(param1);
      }
      
      public function serializeAs_CharacterCreationResultMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.result);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterCreationResultMessage(param1);
      }
      
      public function deserializeAs_CharacterCreationResultMessage(param1:IDataInput) : void
      {
         this.result = param1.readByte();
         if(this.result < 0)
         {
            throw new Error("Forbidden value (" + this.result + ") on element of CharacterCreationResultMessage.result.");
         }
      }
   }
}
