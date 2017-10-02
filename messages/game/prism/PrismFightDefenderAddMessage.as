package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.dofus.network.types.game.character.CharacterMinimalPlusLookAndGradeInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismFightDefenderAddMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5895;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:Number = 0;
      
      public var fighterMovementInformations:CharacterMinimalPlusLookAndGradeInformations;
      
      public var inMain:Boolean = false;
      
      public function PrismFightDefenderAddMessage()
      {
         this.fighterMovementInformations = new CharacterMinimalPlusLookAndGradeInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5895;
      }
      
      public function initPrismFightDefenderAddMessage(param1:Number = 0, param2:CharacterMinimalPlusLookAndGradeInformations = null, param3:Boolean = false) : PrismFightDefenderAddMessage
      {
         this.fightId = param1;
         this.fighterMovementInformations = param2;
         this.inMain = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.fighterMovementInformations = new CharacterMinimalPlusLookAndGradeInformations();
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
         this.serializeAs_PrismFightDefenderAddMessage(param1);
      }
      
      public function serializeAs_PrismFightDefenderAddMessage(param1:IDataOutput) : void
      {
         param1.writeDouble(this.fightId);
         this.fighterMovementInformations.serializeAs_CharacterMinimalPlusLookAndGradeInformations(param1);
         param1.writeBoolean(this.inMain);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismFightDefenderAddMessage(param1);
      }
      
      public function deserializeAs_PrismFightDefenderAddMessage(param1:IDataInput) : void
      {
         this.fightId = param1.readDouble();
         this.fighterMovementInformations = new CharacterMinimalPlusLookAndGradeInformations();
         this.fighterMovementInformations.deserialize(param1);
         this.inMain = param1.readBoolean();
      }
   }
}
