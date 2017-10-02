package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.dofus.network.types.game.character.CharacterMinimalPlusLookAndGradeInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismFightDefendersStateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5899;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:Number = 0;
      
      public var mainFighters:Vector.<CharacterMinimalPlusLookAndGradeInformations>;
      
      public var reserveFighters:Vector.<CharacterMinimalPlusLookAndGradeInformations>;
      
      public function PrismFightDefendersStateMessage()
      {
         this.mainFighters = new Vector.<CharacterMinimalPlusLookAndGradeInformations>();
         this.reserveFighters = new Vector.<CharacterMinimalPlusLookAndGradeInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5899;
      }
      
      public function initPrismFightDefendersStateMessage(param1:Number = 0, param2:Vector.<CharacterMinimalPlusLookAndGradeInformations> = null, param3:Vector.<CharacterMinimalPlusLookAndGradeInformations> = null) : PrismFightDefendersStateMessage
      {
         this.fightId = param1;
         this.mainFighters = param2;
         this.reserveFighters = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.mainFighters = new Vector.<CharacterMinimalPlusLookAndGradeInformations>();
         this.reserveFighters = new Vector.<CharacterMinimalPlusLookAndGradeInformations>();
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
         this.serializeAs_PrismFightDefendersStateMessage(param1);
      }
      
      public function serializeAs_PrismFightDefendersStateMessage(param1:IDataOutput) : void
      {
         param1.writeDouble(this.fightId);
         param1.writeShort(this.mainFighters.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.mainFighters.length)
         {
            (this.mainFighters[_loc2_] as CharacterMinimalPlusLookAndGradeInformations).serializeAs_CharacterMinimalPlusLookAndGradeInformations(param1);
            _loc2_++;
         }
         param1.writeShort(this.reserveFighters.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.reserveFighters.length)
         {
            (this.reserveFighters[_loc3_] as CharacterMinimalPlusLookAndGradeInformations).serializeAs_CharacterMinimalPlusLookAndGradeInformations(param1);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismFightDefendersStateMessage(param1);
      }
      
      public function deserializeAs_PrismFightDefendersStateMessage(param1:IDataInput) : void
      {
         var _loc6_:CharacterMinimalPlusLookAndGradeInformations = null;
         var _loc7_:CharacterMinimalPlusLookAndGradeInformations = null;
         this.fightId = param1.readDouble();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = new CharacterMinimalPlusLookAndGradeInformations();
            _loc6_.deserialize(param1);
            this.mainFighters.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new CharacterMinimalPlusLookAndGradeInformations();
            _loc7_.deserialize(param1);
            this.reserveFighters.push(_loc7_);
            _loc5_++;
         }
      }
   }
}
