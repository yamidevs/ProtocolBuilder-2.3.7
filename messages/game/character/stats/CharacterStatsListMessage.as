package com.ankamagames.dofus.network.messages.game.character.stats
{
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharacterStatsListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 500;
       
      
      private var _isInitialized:Boolean = false;
      
      public var stats:CharacterCharacteristicsInformations;
      
      public function CharacterStatsListMessage()
      {
         this.stats = new CharacterCharacteristicsInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 500;
      }
      
      public function initCharacterStatsListMessage(param1:CharacterCharacteristicsInformations = null) : CharacterStatsListMessage
      {
         this.stats = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.stats = new CharacterCharacteristicsInformations();
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
         this.serializeAs_CharacterStatsListMessage(param1);
      }
      
      public function serializeAs_CharacterStatsListMessage(param1:IDataOutput) : void
      {
         this.stats.serializeAs_CharacterCharacteristicsInformations(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterStatsListMessage(param1);
      }
      
      public function deserializeAs_CharacterStatsListMessage(param1:IDataInput) : void
      {
         this.stats = new CharacterCharacteristicsInformations();
         this.stats.deserialize(param1);
      }
   }
}
