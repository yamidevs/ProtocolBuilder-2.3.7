package com.ankamagames.dofus.network.messages.game.guild.tax
{
   import com.ankamagames.dofus.network.types.game.character.CharacterMinimalPlusLookInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildFightPlayersEnemiesListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5928;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:Number = 0;
      
      public var playerInfo:Vector.<CharacterMinimalPlusLookInformations>;
      
      public function GuildFightPlayersEnemiesListMessage()
      {
         this.playerInfo = new Vector.<CharacterMinimalPlusLookInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5928;
      }
      
      public function initGuildFightPlayersEnemiesListMessage(param1:Number = 0, param2:Vector.<CharacterMinimalPlusLookInformations> = null) : GuildFightPlayersEnemiesListMessage
      {
         this.fightId = param1;
         this.playerInfo = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.playerInfo = new Vector.<CharacterMinimalPlusLookInformations>();
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
         this.serializeAs_GuildFightPlayersEnemiesListMessage(param1);
      }
      
      public function serializeAs_GuildFightPlayersEnemiesListMessage(param1:IDataOutput) : void
      {
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element fightId.");
         }
         param1.writeDouble(this.fightId);
         param1.writeShort(this.playerInfo.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.playerInfo.length)
         {
            (this.playerInfo[_loc2_] as CharacterMinimalPlusLookInformations).serializeAs_CharacterMinimalPlusLookInformations(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildFightPlayersEnemiesListMessage(param1);
      }
      
      public function deserializeAs_GuildFightPlayersEnemiesListMessage(param1:IDataInput) : void
      {
         var _loc4_:CharacterMinimalPlusLookInformations = null;
         this.fightId = param1.readDouble();
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element of GuildFightPlayersEnemiesListMessage.fightId.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new CharacterMinimalPlusLookInformations();
            _loc4_.deserialize(param1);
            this.playerInfo.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
