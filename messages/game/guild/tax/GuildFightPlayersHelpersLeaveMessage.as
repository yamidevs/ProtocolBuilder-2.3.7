package com.ankamagames.dofus.network.messages.game.guild.tax
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildFightPlayersHelpersLeaveMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5719;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:Number = 0;
      
      public var playerId:uint = 0;
      
      public function GuildFightPlayersHelpersLeaveMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5719;
      }
      
      public function initGuildFightPlayersHelpersLeaveMessage(param1:Number = 0, param2:uint = 0) : GuildFightPlayersHelpersLeaveMessage
      {
         this.fightId = param1;
         this.playerId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.playerId = 0;
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
         this.serializeAs_GuildFightPlayersHelpersLeaveMessage(param1);
      }
      
      public function serializeAs_GuildFightPlayersHelpersLeaveMessage(param1:IDataOutput) : void
      {
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element fightId.");
         }
         param1.writeDouble(this.fightId);
         if(this.playerId < 0)
         {
            throw new Error("Forbidden value (" + this.playerId + ") on element playerId.");
         }
         param1.writeInt(this.playerId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildFightPlayersHelpersLeaveMessage(param1);
      }
      
      public function deserializeAs_GuildFightPlayersHelpersLeaveMessage(param1:IDataInput) : void
      {
         this.fightId = param1.readDouble();
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element of GuildFightPlayersHelpersLeaveMessage.fightId.");
         }
         this.playerId = param1.readInt();
         if(this.playerId < 0)
         {
            throw new Error("Forbidden value (" + this.playerId + ") on element of GuildFightPlayersHelpersLeaveMessage.playerId.");
         }
      }
   }
}
