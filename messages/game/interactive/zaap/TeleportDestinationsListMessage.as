package com.ankamagames.dofus.network.messages.game.interactive.zaap
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class TeleportDestinationsListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5960;
       
      
      private var _isInitialized:Boolean = false;
      
      public var teleporterType:uint = 0;
      
      public var mapIds:Vector.<uint>;
      
      public var subareaIds:Vector.<uint>;
      
      public var costs:Vector.<uint>;
      
      public function TeleportDestinationsListMessage()
      {
         this.mapIds = new Vector.<uint>();
         this.subareaIds = new Vector.<uint>();
         this.costs = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5960;
      }
      
      public function initTeleportDestinationsListMessage(param1:uint = 0, param2:Vector.<uint> = null, param3:Vector.<uint> = null, param4:Vector.<uint> = null) : TeleportDestinationsListMessage
      {
         this.teleporterType = param1;
         this.mapIds = param2;
         this.subareaIds = param3;
         this.costs = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.teleporterType = 0;
         this.mapIds = new Vector.<uint>();
         this.subareaIds = new Vector.<uint>();
         this.costs = new Vector.<uint>();
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
         this.serializeAs_TeleportDestinationsListMessage(param1);
      }
      
      public function serializeAs_TeleportDestinationsListMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.teleporterType);
         param1.writeShort(this.mapIds.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.mapIds.length)
         {
            if(this.mapIds[_loc2_] < 0)
            {
               throw new Error("Forbidden value (" + this.mapIds[_loc2_] + ") on element 2 (starting at 1) of mapIds.");
            }
            param1.writeInt(this.mapIds[_loc2_]);
            _loc2_++;
         }
         param1.writeShort(this.subareaIds.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.subareaIds.length)
         {
            if(this.subareaIds[_loc3_] < 0)
            {
               throw new Error("Forbidden value (" + this.subareaIds[_loc3_] + ") on element 3 (starting at 1) of subareaIds.");
            }
            param1.writeShort(this.subareaIds[_loc3_]);
            _loc3_++;
         }
         param1.writeShort(this.costs.length);
         var _loc4_:uint = 0;
         while(_loc4_ < this.costs.length)
         {
            if(this.costs[_loc4_] < 0)
            {
               throw new Error("Forbidden value (" + this.costs[_loc4_] + ") on element 4 (starting at 1) of costs.");
            }
            param1.writeShort(this.costs[_loc4_]);
            _loc4_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_TeleportDestinationsListMessage(param1);
      }
      
      public function deserializeAs_TeleportDestinationsListMessage(param1:IDataInput) : void
      {
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         this.teleporterType = param1.readByte();
         if(this.teleporterType < 0)
         {
            throw new Error("Forbidden value (" + this.teleporterType + ") on element of TeleportDestinationsListMessage.teleporterType.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc8_ = param1.readInt();
            if(_loc8_ < 0)
            {
               throw new Error("Forbidden value (" + _loc8_ + ") on elements of mapIds.");
            }
            this.mapIds.push(_loc8_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc9_ = param1.readShort();
            if(_loc9_ < 0)
            {
               throw new Error("Forbidden value (" + _loc9_ + ") on elements of subareaIds.");
            }
            this.subareaIds.push(_loc9_);
            _loc5_++;
         }
         var _loc6_:uint = param1.readUnsignedShort();
         var _loc7_:uint = 0;
         while(_loc7_ < _loc6_)
         {
            _loc10_ = param1.readShort();
            if(_loc10_ < 0)
            {
               throw new Error("Forbidden value (" + _loc10_ + ") on elements of costs.");
            }
            this.costs.push(_loc10_);
            _loc7_++;
         }
      }
   }
}
