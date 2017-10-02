package com.ankamagames.dofus.network.types.game.guild.tax
{
   import com.ankamagames.dofus.network.types.game.character.CharacterMinimalPlusLookInformations;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class TaxCollectorFightersInformation implements INetworkType
   {
      
      public static const protocolId:uint = 169;
       
      
      public var collectorId:int = 0;
      
      public var allyCharactersInformations:Vector.<CharacterMinimalPlusLookInformations>;
      
      public var enemyCharactersInformations:Vector.<CharacterMinimalPlusLookInformations>;
      
      public function TaxCollectorFightersInformation()
      {
         this.allyCharactersInformations = new Vector.<CharacterMinimalPlusLookInformations>();
         this.enemyCharactersInformations = new Vector.<CharacterMinimalPlusLookInformations>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 169;
      }
      
      public function initTaxCollectorFightersInformation(param1:int = 0, param2:Vector.<CharacterMinimalPlusLookInformations> = null, param3:Vector.<CharacterMinimalPlusLookInformations> = null) : TaxCollectorFightersInformation
      {
         this.collectorId = param1;
         this.allyCharactersInformations = param2;
         this.enemyCharactersInformations = param3;
         return this;
      }
      
      public function reset() : void
      {
         this.collectorId = 0;
         this.allyCharactersInformations = new Vector.<CharacterMinimalPlusLookInformations>();
         this.enemyCharactersInformations = new Vector.<CharacterMinimalPlusLookInformations>();
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_TaxCollectorFightersInformation(param1);
      }
      
      public function serializeAs_TaxCollectorFightersInformation(param1:IDataOutput) : void
      {
         param1.writeInt(this.collectorId);
         param1.writeShort(this.allyCharactersInformations.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.allyCharactersInformations.length)
         {
            (this.allyCharactersInformations[_loc2_] as CharacterMinimalPlusLookInformations).serializeAs_CharacterMinimalPlusLookInformations(param1);
            _loc2_++;
         }
         param1.writeShort(this.enemyCharactersInformations.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.enemyCharactersInformations.length)
         {
            (this.enemyCharactersInformations[_loc3_] as CharacterMinimalPlusLookInformations).serializeAs_CharacterMinimalPlusLookInformations(param1);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_TaxCollectorFightersInformation(param1);
      }
      
      public function deserializeAs_TaxCollectorFightersInformation(param1:IDataInput) : void
      {
         var _loc6_:CharacterMinimalPlusLookInformations = null;
         var _loc7_:CharacterMinimalPlusLookInformations = null;
         this.collectorId = param1.readInt();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = new CharacterMinimalPlusLookInformations();
            _loc6_.deserialize(param1);
            this.allyCharactersInformations.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new CharacterMinimalPlusLookInformations();
            _loc7_.deserialize(param1);
            this.enemyCharactersInformations.push(_loc7_);
            _loc5_++;
         }
      }
   }
}
