package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.dofus.network.types.game.character.CharacterMinimalPlusLookAndGradeInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismFightAttackerAddMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5893;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:Number = 0;
      
      public var charactersDescription:Vector.<CharacterMinimalPlusLookAndGradeInformations>;
      
      public function PrismFightAttackerAddMessage()
      {
         this.charactersDescription = new Vector.<CharacterMinimalPlusLookAndGradeInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5893;
      }
      
      public function initPrismFightAttackerAddMessage(param1:Number = 0, param2:Vector.<CharacterMinimalPlusLookAndGradeInformations> = null) : PrismFightAttackerAddMessage
      {
         this.fightId = param1;
         this.charactersDescription = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.charactersDescription = new Vector.<CharacterMinimalPlusLookAndGradeInformations>();
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
         this.serializeAs_PrismFightAttackerAddMessage(param1);
      }
      
      public function serializeAs_PrismFightAttackerAddMessage(param1:IDataOutput) : void
      {
         param1.writeDouble(this.fightId);
         param1.writeShort(this.charactersDescription.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.charactersDescription.length)
         {
            (this.charactersDescription[_loc2_] as CharacterMinimalPlusLookAndGradeInformations).serializeAs_CharacterMinimalPlusLookAndGradeInformations(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismFightAttackerAddMessage(param1);
      }
      
      public function deserializeAs_PrismFightAttackerAddMessage(param1:IDataInput) : void
      {
         var _loc4_:CharacterMinimalPlusLookAndGradeInformations = null;
         this.fightId = param1.readDouble();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new CharacterMinimalPlusLookAndGradeInformations();
            _loc4_.deserialize(param1);
            this.charactersDescription.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
