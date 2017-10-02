package com.ankamagames.dofus.network.messages.game.character.choice
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.character.choice.CharacterBaseInformations;
   import com.ankamagames.dofus.network.types.game.character.choice.CharacterToRecolorInformation;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharactersListWithModificationsMessage extends CharactersListMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6120;
       
      
      private var _isInitialized:Boolean = false;
      
      public var charactersToRecolor:Vector.<CharacterToRecolorInformation>;
      
      public var charactersToRename:Vector.<int>;
      
      public var unusableCharacters:Vector.<int>;
      
      public function CharactersListWithModificationsMessage()
      {
         this.charactersToRecolor = new Vector.<CharacterToRecolorInformation>();
         this.charactersToRename = new Vector.<int>();
         this.unusableCharacters = new Vector.<int>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6120;
      }
      
      public function initCharactersListWithModificationsMessage(param1:Boolean = false, param2:Vector.<CharacterBaseInformations> = null, param3:Vector.<CharacterToRecolorInformation> = null, param4:Vector.<int> = null, param5:Vector.<int> = null) : CharactersListWithModificationsMessage
      {
         super.initCharactersListMessage(param1,param2);
         this.charactersToRecolor = param3;
         this.charactersToRename = param4;
         this.unusableCharacters = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.charactersToRecolor = new Vector.<CharacterToRecolorInformation>();
         this.charactersToRename = new Vector.<int>();
         this.unusableCharacters = new Vector.<int>();
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_CharactersListWithModificationsMessage(param1);
      }
      
      public function serializeAs_CharactersListWithModificationsMessage(param1:IDataOutput) : void
      {
         super.serializeAs_CharactersListMessage(param1);
         param1.writeShort(this.charactersToRecolor.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.charactersToRecolor.length)
         {
            param1.writeShort((this.charactersToRecolor[_loc2_] as CharacterToRecolorInformation).getTypeId());
            (this.charactersToRecolor[_loc2_] as CharacterToRecolorInformation).serialize(param1);
            _loc2_++;
         }
         param1.writeShort(this.charactersToRename.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.charactersToRename.length)
         {
            param1.writeInt(this.charactersToRename[_loc3_]);
            _loc3_++;
         }
         param1.writeShort(this.unusableCharacters.length);
         var _loc4_:uint = 0;
         while(_loc4_ < this.unusableCharacters.length)
         {
            param1.writeInt(this.unusableCharacters[_loc4_]);
            _loc4_++;
         }
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharactersListWithModificationsMessage(param1);
      }
      
      public function deserializeAs_CharactersListWithModificationsMessage(param1:IDataInput) : void
      {
         var _loc8_:uint = 0;
         var _loc9_:CharacterToRecolorInformation = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         super.deserialize(param1);
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc8_ = param1.readUnsignedShort();
            _loc9_ = ProtocolTypeManager.getInstance(CharacterToRecolorInformation,_loc8_);
            _loc9_.deserialize(param1);
            this.charactersToRecolor.push(_loc9_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc10_ = param1.readInt();
            this.charactersToRename.push(_loc10_);
            _loc5_++;
         }
         var _loc6_:uint = param1.readUnsignedShort();
         var _loc7_:uint = 0;
         while(_loc7_ < _loc6_)
         {
            _loc11_ = param1.readInt();
            this.unusableCharacters.push(_loc11_);
            _loc7_++;
         }
      }
   }
}
