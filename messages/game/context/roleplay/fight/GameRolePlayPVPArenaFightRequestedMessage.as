package com.ankamagames.dofus.network.messages.game.context.roleplay.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameRolePlayPVPArenaFightRequestedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6258;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:uint = 0;
      
      public var fightersIDs:Vector.<uint>;
      
      public function GameRolePlayPVPArenaFightRequestedMessage()
      {
         this.fightersIDs = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6258;
      }
      
      public function initGameRolePlayPVPArenaFightRequestedMessage(param1:uint = 0, param2:Vector.<uint> = null) : GameRolePlayPVPArenaFightRequestedMessage
      {
         this.fightId = param1;
         this.fightersIDs = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.fightersIDs = new Vector.<uint>();
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
         this.serializeAs_GameRolePlayPVPArenaFightRequestedMessage(param1);
      }
      
      public function serializeAs_GameRolePlayPVPArenaFightRequestedMessage(param1:IDataOutput) : void
      {
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element fightId.");
         }
         param1.writeInt(this.fightId);
         param1.writeShort(this.fightersIDs.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.fightersIDs.length)
         {
            if(this.fightersIDs[_loc2_] < 0)
            {
               throw new Error("Forbidden value (" + this.fightersIDs[_loc2_] + ") on element 2 (starting at 1) of fightersIDs.");
            }
            param1.writeInt(this.fightersIDs[_loc2_]);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayPVPArenaFightRequestedMessage(param1);
      }
      
      public function deserializeAs_GameRolePlayPVPArenaFightRequestedMessage(param1:IDataInput) : void
      {
         var _loc4_:uint = 0;
         this.fightId = param1.readInt();
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element of GameRolePlayPVPArenaFightRequestedMessage.fightId.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            if(_loc4_ < 0)
            {
               throw new Error("Forbidden value (" + _loc4_ + ") on elements of fightersIDs.");
            }
            this.fightersIDs.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
