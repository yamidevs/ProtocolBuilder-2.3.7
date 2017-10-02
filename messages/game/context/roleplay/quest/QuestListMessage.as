package com.ankamagames.dofus.network.messages.game.context.roleplay.quest
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class QuestListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5626;
       
      
      private var _isInitialized:Boolean = false;
      
      public var finishedQuestsIds:Vector.<uint>;
      
      public var activeQuestsIds:Vector.<uint>;
      
      public function QuestListMessage()
      {
         this.finishedQuestsIds = new Vector.<uint>();
         this.activeQuestsIds = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5626;
      }
      
      public function initQuestListMessage(param1:Vector.<uint> = null, param2:Vector.<uint> = null) : QuestListMessage
      {
         this.finishedQuestsIds = param1;
         this.activeQuestsIds = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.finishedQuestsIds = new Vector.<uint>();
         this.activeQuestsIds = new Vector.<uint>();
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
         this.serializeAs_QuestListMessage(param1);
      }
      
      public function serializeAs_QuestListMessage(param1:IDataOutput) : void
      {
         param1.writeShort(this.finishedQuestsIds.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.finishedQuestsIds.length)
         {
            if(this.finishedQuestsIds[_loc2_] < 0)
            {
               throw new Error("Forbidden value (" + this.finishedQuestsIds[_loc2_] + ") on element 1 (starting at 1) of finishedQuestsIds.");
            }
            param1.writeShort(this.finishedQuestsIds[_loc2_]);
            _loc2_++;
         }
         param1.writeShort(this.activeQuestsIds.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.activeQuestsIds.length)
         {
            if(this.activeQuestsIds[_loc3_] < 0)
            {
               throw new Error("Forbidden value (" + this.activeQuestsIds[_loc3_] + ") on element 2 (starting at 1) of activeQuestsIds.");
            }
            param1.writeShort(this.activeQuestsIds[_loc3_]);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_QuestListMessage(param1);
      }
      
      public function deserializeAs_QuestListMessage(param1:IDataInput) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readShort();
            if(_loc6_ < 0)
            {
               throw new Error("Forbidden value (" + _loc6_ + ") on elements of finishedQuestsIds.");
            }
            this.finishedQuestsIds.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readShort();
            if(_loc7_ < 0)
            {
               throw new Error("Forbidden value (" + _loc7_ + ") on elements of activeQuestsIds.");
            }
            this.activeQuestsIds.push(_loc7_);
            _loc5_++;
         }
      }
   }
}
