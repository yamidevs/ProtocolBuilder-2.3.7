package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.dofus.network.types.game.house.HouseInformationsForGuild;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildHouseUpdateInformationMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6181;
       
      
      private var _isInitialized:Boolean = false;
      
      public var housesInformations:HouseInformationsForGuild;
      
      public function GuildHouseUpdateInformationMessage()
      {
         this.housesInformations = new HouseInformationsForGuild();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6181;
      }
      
      public function initGuildHouseUpdateInformationMessage(param1:HouseInformationsForGuild = null) : GuildHouseUpdateInformationMessage
      {
         this.housesInformations = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.housesInformations = new HouseInformationsForGuild();
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
         this.serializeAs_GuildHouseUpdateInformationMessage(param1);
      }
      
      public function serializeAs_GuildHouseUpdateInformationMessage(param1:IDataOutput) : void
      {
         this.housesInformations.serializeAs_HouseInformationsForGuild(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildHouseUpdateInformationMessage(param1);
      }
      
      public function deserializeAs_GuildHouseUpdateInformationMessage(param1:IDataInput) : void
      {
         this.housesInformations = new HouseInformationsForGuild();
         this.housesInformations.deserialize(param1);
      }
   }
}
