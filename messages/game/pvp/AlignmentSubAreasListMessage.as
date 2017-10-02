package com.ankamagames.dofus.network.messages.game.pvp
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AlignmentSubAreasListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6059;
       
      
      private var _isInitialized:Boolean = false;
      
      public var angelsSubAreas:Vector.<int>;
      
      public var evilsSubAreas:Vector.<int>;
      
      public function AlignmentSubAreasListMessage()
      {
         this.angelsSubAreas = new Vector.<int>();
         this.evilsSubAreas = new Vector.<int>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6059;
      }
      
      public function initAlignmentSubAreasListMessage(param1:Vector.<int> = null, param2:Vector.<int> = null) : AlignmentSubAreasListMessage
      {
         this.angelsSubAreas = param1;
         this.evilsSubAreas = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.angelsSubAreas = new Vector.<int>();
         this.evilsSubAreas = new Vector.<int>();
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
         this.serializeAs_AlignmentSubAreasListMessage(param1);
      }
      
      public function serializeAs_AlignmentSubAreasListMessage(param1:IDataOutput) : void
      {
         param1.writeShort(this.angelsSubAreas.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.angelsSubAreas.length)
         {
            param1.writeShort(this.angelsSubAreas[_loc2_]);
            _loc2_++;
         }
         param1.writeShort(this.evilsSubAreas.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.evilsSubAreas.length)
         {
            param1.writeShort(this.evilsSubAreas[_loc3_]);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AlignmentSubAreasListMessage(param1);
      }
      
      public function deserializeAs_AlignmentSubAreasListMessage(param1:IDataInput) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readShort();
            this.angelsSubAreas.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readShort();
            this.evilsSubAreas.push(_loc7_);
            _loc5_++;
         }
      }
   }
}
