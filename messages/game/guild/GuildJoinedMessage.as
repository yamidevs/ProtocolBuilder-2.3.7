package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.GuildInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildJoinedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5564;
       
      
      private var _isInitialized:Boolean = false;
      
      public var guildInfo:GuildInformations;
      
      public var memberRights:uint = 0;
      
      public function GuildJoinedMessage()
      {
         this.guildInfo = new GuildInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5564;
      }
      
      public function initGuildJoinedMessage(param1:GuildInformations = null, param2:uint = 0) : GuildJoinedMessage
      {
         this.guildInfo = param1;
         this.memberRights = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.guildInfo = new GuildInformations();
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
         this.serializeAs_GuildJoinedMessage(param1);
      }
      
      public function serializeAs_GuildJoinedMessage(param1:IDataOutput) : void
      {
         this.guildInfo.serializeAs_GuildInformations(param1);
         if(this.memberRights < 0 || this.memberRights > 4294967295)
         {
            throw new Error("Forbidden value (" + this.memberRights + ") on element memberRights.");
         }
         param1.writeUnsignedInt(this.memberRights);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildJoinedMessage(param1);
      }
      
      public function deserializeAs_GuildJoinedMessage(param1:IDataInput) : void
      {
         this.guildInfo = new GuildInformations();
         this.guildInfo.deserialize(param1);
         this.memberRights = param1.readUnsignedInt();
         if(this.memberRights < 0 || this.memberRights > 4294967295)
         {
            throw new Error("Forbidden value (" + this.memberRights + ") on element of GuildJoinedMessage.memberRights.");
         }
      }
   }
}
