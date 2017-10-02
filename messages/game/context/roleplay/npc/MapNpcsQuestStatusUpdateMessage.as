package com.ankamagames.dofus.network.messages.game.context.roleplay.npc
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class MapNpcsQuestStatusUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5642;
       
      
      private var _isInitialized:Boolean = false;
      
      public var mapId:int = 0;
      
      public var npcsIdsCanGiveQuest:Vector.<int>;
      
      public var npcsIdsCannotGiveQuest:Vector.<int>;
      
      public function MapNpcsQuestStatusUpdateMessage()
      {
         this.npcsIdsCanGiveQuest = new Vector.<int>();
         this.npcsIdsCannotGiveQuest = new Vector.<int>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5642;
      }
      
      public function initMapNpcsQuestStatusUpdateMessage(param1:int = 0, param2:Vector.<int> = null, param3:Vector.<int> = null) : MapNpcsQuestStatusUpdateMessage
      {
         this.mapId = param1;
         this.npcsIdsCanGiveQuest = param2;
         this.npcsIdsCannotGiveQuest = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.mapId = 0;
         this.npcsIdsCanGiveQuest = new Vector.<int>();
         this.npcsIdsCannotGiveQuest = new Vector.<int>();
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
         this.serializeAs_MapNpcsQuestStatusUpdateMessage(param1);
      }
      
      public function serializeAs_MapNpcsQuestStatusUpdateMessage(param1:IDataOutput) : void
      {
         param1.writeInt(this.mapId);
         param1.writeShort(this.npcsIdsCanGiveQuest.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.npcsIdsCanGiveQuest.length)
         {
            param1.writeInt(this.npcsIdsCanGiveQuest[_loc2_]);
            _loc2_++;
         }
         param1.writeShort(this.npcsIdsCannotGiveQuest.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.npcsIdsCannotGiveQuest.length)
         {
            param1.writeInt(this.npcsIdsCannotGiveQuest[_loc3_]);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MapNpcsQuestStatusUpdateMessage(param1);
      }
      
      public function deserializeAs_MapNpcsQuestStatusUpdateMessage(param1:IDataInput) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this.mapId = param1.readInt();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readInt();
            this.npcsIdsCanGiveQuest.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readInt();
            this.npcsIdsCannotGiveQuest.push(_loc7_);
            _loc5_++;
         }
      }
   }
}
