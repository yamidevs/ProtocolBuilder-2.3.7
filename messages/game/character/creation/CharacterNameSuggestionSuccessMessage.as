package com.ankamagames.dofus.network.messages.game.character.creation
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharacterNameSuggestionSuccessMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5544;
       
      
      private var _isInitialized:Boolean = false;
      
      public var suggestion:String = "";
      
      public function CharacterNameSuggestionSuccessMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5544;
      }
      
      public function initCharacterNameSuggestionSuccessMessage(param1:String = "") : CharacterNameSuggestionSuccessMessage
      {
         this.suggestion = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.suggestion = "";
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
         this.serializeAs_CharacterNameSuggestionSuccessMessage(param1);
      }
      
      public function serializeAs_CharacterNameSuggestionSuccessMessage(param1:IDataOutput) : void
      {
         param1.writeUTF(this.suggestion);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterNameSuggestionSuccessMessage(param1);
      }
      
      public function deserializeAs_CharacterNameSuggestionSuccessMessage(param1:IDataInput) : void
      {
         this.suggestion = param1.readUTF();
      }
   }
}
