package com.ankamagames.dofus.network.messages.game.context.roleplay
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class MapRunningFightDetailsMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5751;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:uint = 0;
      
      public var names:Vector.<String>;
      
      public var levels:Vector.<uint>;
      
      public var teamSwap:uint = 0;
      
      public var alives:Vector.<Boolean>;
      
      public function MapRunningFightDetailsMessage()
      {
         this.names = new Vector.<String>();
         this.levels = new Vector.<uint>();
         this.alives = new Vector.<Boolean>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5751;
      }
      
      public function initMapRunningFightDetailsMessage(param1:uint = 0, param2:Vector.<String> = null, param3:Vector.<uint> = null, param4:uint = 0, param5:Vector.<Boolean> = null) : MapRunningFightDetailsMessage
      {
         this.fightId = param1;
         this.names = param2;
         this.levels = param3;
         this.teamSwap = param4;
         this.alives = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.names = new Vector.<String>();
         this.levels = new Vector.<uint>();
         this.teamSwap = 0;
         this.alives = new Vector.<Boolean>();
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
         this.serializeAs_MapRunningFightDetailsMessage(param1);
      }
      
      public function serializeAs_MapRunningFightDetailsMessage(param1:IDataOutput) : void
      {
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element fightId.");
         }
         param1.writeInt(this.fightId);
         param1.writeShort(this.names.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.names.length)
         {
            param1.writeUTF(this.names[_loc2_]);
            _loc2_++;
         }
         param1.writeShort(this.levels.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.levels.length)
         {
            if(this.levels[_loc3_] < 0)
            {
               throw new Error("Forbidden value (" + this.levels[_loc3_] + ") on element 3 (starting at 1) of levels.");
            }
            param1.writeShort(this.levels[_loc3_]);
            _loc3_++;
         }
         if(this.teamSwap < 0)
         {
            throw new Error("Forbidden value (" + this.teamSwap + ") on element teamSwap.");
         }
         param1.writeByte(this.teamSwap);
         param1.writeShort(this.alives.length);
         var _loc4_:uint = 0;
         while(_loc4_ < this.alives.length)
         {
            param1.writeBoolean(this.alives[_loc4_]);
            _loc4_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MapRunningFightDetailsMessage(param1);
      }
      
      public function deserializeAs_MapRunningFightDetailsMessage(param1:IDataInput) : void
      {
         var _loc8_:String = null;
         var _loc9_:uint = 0;
         var _loc10_:Boolean = false;
         this.fightId = param1.readInt();
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element of MapRunningFightDetailsMessage.fightId.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc8_ = param1.readUTF();
            this.names.push(_loc8_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc9_ = param1.readShort();
            if(_loc9_ < 0)
            {
               throw new Error("Forbidden value (" + _loc9_ + ") on elements of levels.");
            }
            this.levels.push(_loc9_);
            _loc5_++;
         }
         this.teamSwap = param1.readByte();
         if(this.teamSwap < 0)
         {
            throw new Error("Forbidden value (" + this.teamSwap + ") on element of MapRunningFightDetailsMessage.teamSwap.");
         }
         var _loc6_:uint = param1.readUnsignedShort();
         var _loc7_:uint = 0;
         while(_loc7_ < _loc6_)
         {
            _loc10_ = param1.readBoolean();
            this.alives.push(_loc10_);
            _loc7_++;
         }
      }
   }
}
