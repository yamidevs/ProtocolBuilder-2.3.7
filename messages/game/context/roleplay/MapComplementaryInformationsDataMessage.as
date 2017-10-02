package com.ankamagames.dofus.network.messages.game.context.roleplay
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.context.fight.FightCommonInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayActorInformations;
   import com.ankamagames.dofus.network.types.game.house.HouseInformations;
   import com.ankamagames.dofus.network.types.game.interactive.InteractiveElement;
   import com.ankamagames.dofus.network.types.game.interactive.MapObstacle;
   import com.ankamagames.dofus.network.types.game.interactive.StatedElement;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class MapComplementaryInformationsDataMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 226;
       
      
      private var _isInitialized:Boolean = false;
      
      public var subareaId:uint = 0;
      
      public var mapId:uint = 0;
      
      public var subareaAlignmentSide:int = 0;
      
      public var houses:Vector.<HouseInformations>;
      
      public var actors:Vector.<GameRolePlayActorInformations>;
      
      public var interactiveElements:Vector.<InteractiveElement>;
      
      public var statedElements:Vector.<StatedElement>;
      
      public var obstacles:Vector.<MapObstacle>;
      
      public var fights:Vector.<FightCommonInformations>;
      
      public function MapComplementaryInformationsDataMessage()
      {
         this.houses = new Vector.<HouseInformations>();
         this.actors = new Vector.<GameRolePlayActorInformations>();
         this.interactiveElements = new Vector.<InteractiveElement>();
         this.statedElements = new Vector.<StatedElement>();
         this.obstacles = new Vector.<MapObstacle>();
         this.fights = new Vector.<FightCommonInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 226;
      }
      
      public function initMapComplementaryInformationsDataMessage(param1:uint = 0, param2:uint = 0, param3:int = 0, param4:Vector.<HouseInformations> = null, param5:Vector.<GameRolePlayActorInformations> = null, param6:Vector.<InteractiveElement> = null, param7:Vector.<StatedElement> = null, param8:Vector.<MapObstacle> = null, param9:Vector.<FightCommonInformations> = null) : MapComplementaryInformationsDataMessage
      {
         this.subareaId = param1;
         this.mapId = param2;
         this.subareaAlignmentSide = param3;
         this.houses = param4;
         this.actors = param5;
         this.interactiveElements = param6;
         this.statedElements = param7;
         this.obstacles = param8;
         this.fights = param9;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.subareaId = 0;
         this.mapId = 0;
         this.subareaAlignmentSide = 0;
         this.houses = new Vector.<HouseInformations>();
         this.actors = new Vector.<GameRolePlayActorInformations>();
         this.interactiveElements = new Vector.<InteractiveElement>();
         this.statedElements = new Vector.<StatedElement>();
         this.obstacles = new Vector.<MapObstacle>();
         this.fights = new Vector.<FightCommonInformations>();
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
         this.serializeAs_MapComplementaryInformationsDataMessage(param1);
      }
      
      public function serializeAs_MapComplementaryInformationsDataMessage(param1:IDataOutput) : void
      {
         if(this.subareaId < 0)
         {
            throw new Error("Forbidden value (" + this.subareaId + ") on element subareaId.");
         }
         param1.writeShort(this.subareaId);
         if(this.mapId < 0)
         {
            throw new Error("Forbidden value (" + this.mapId + ") on element mapId.");
         }
         param1.writeInt(this.mapId);
         param1.writeByte(this.subareaAlignmentSide);
         param1.writeShort(this.houses.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.houses.length)
         {
            param1.writeShort((this.houses[_loc2_] as HouseInformations).getTypeId());
            (this.houses[_loc2_] as HouseInformations).serialize(param1);
            _loc2_++;
         }
         param1.writeShort(this.actors.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.actors.length)
         {
            param1.writeShort((this.actors[_loc3_] as GameRolePlayActorInformations).getTypeId());
            (this.actors[_loc3_] as GameRolePlayActorInformations).serialize(param1);
            _loc3_++;
         }
         param1.writeShort(this.interactiveElements.length);
         var _loc4_:uint = 0;
         while(_loc4_ < this.interactiveElements.length)
         {
            (this.interactiveElements[_loc4_] as InteractiveElement).serializeAs_InteractiveElement(param1);
            _loc4_++;
         }
         param1.writeShort(this.statedElements.length);
         var _loc5_:uint = 0;
         while(_loc5_ < this.statedElements.length)
         {
            (this.statedElements[_loc5_] as StatedElement).serializeAs_StatedElement(param1);
            _loc5_++;
         }
         param1.writeShort(this.obstacles.length);
         var _loc6_:uint = 0;
         while(_loc6_ < this.obstacles.length)
         {
            (this.obstacles[_loc6_] as MapObstacle).serializeAs_MapObstacle(param1);
            _loc6_++;
         }
         param1.writeShort(this.fights.length);
         var _loc7_:uint = 0;
         while(_loc7_ < this.fights.length)
         {
            (this.fights[_loc7_] as FightCommonInformations).serializeAs_FightCommonInformations(param1);
            _loc7_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MapComplementaryInformationsDataMessage(param1);
      }
      
      public function deserializeAs_MapComplementaryInformationsDataMessage(param1:IDataInput) : void
      {
         var _loc14_:uint = 0;
         var _loc15_:HouseInformations = null;
         var _loc16_:uint = 0;
         var _loc17_:GameRolePlayActorInformations = null;
         var _loc18_:InteractiveElement = null;
         var _loc19_:StatedElement = null;
         var _loc20_:MapObstacle = null;
         var _loc21_:FightCommonInformations = null;
         this.subareaId = param1.readShort();
         if(this.subareaId < 0)
         {
            throw new Error("Forbidden value (" + this.subareaId + ") on element of MapComplementaryInformationsDataMessage.subareaId.");
         }
         this.mapId = param1.readInt();
         if(this.mapId < 0)
         {
            throw new Error("Forbidden value (" + this.mapId + ") on element of MapComplementaryInformationsDataMessage.mapId.");
         }
         this.subareaAlignmentSide = param1.readByte();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc14_ = param1.readUnsignedShort();
            _loc15_ = ProtocolTypeManager.getInstance(HouseInformations,_loc14_);
            _loc15_.deserialize(param1);
            this.houses.push(_loc15_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc16_ = param1.readUnsignedShort();
            _loc17_ = ProtocolTypeManager.getInstance(GameRolePlayActorInformations,_loc16_);
            _loc17_.deserialize(param1);
            this.actors.push(_loc17_);
            _loc5_++;
         }
         var _loc6_:uint = param1.readUnsignedShort();
         var _loc7_:uint = 0;
         while(_loc7_ < _loc6_)
         {
            _loc18_ = new InteractiveElement();
            _loc18_.deserialize(param1);
            this.interactiveElements.push(_loc18_);
            _loc7_++;
         }
         var _loc8_:uint = param1.readUnsignedShort();
         var _loc9_:uint = 0;
         while(_loc9_ < _loc8_)
         {
            _loc19_ = new StatedElement();
            _loc19_.deserialize(param1);
            this.statedElements.push(_loc19_);
            _loc9_++;
         }
         var _loc10_:uint = param1.readUnsignedShort();
         var _loc11_:uint = 0;
         while(_loc11_ < _loc10_)
         {
            _loc20_ = new MapObstacle();
            _loc20_.deserialize(param1);
            this.obstacles.push(_loc20_);
            _loc11_++;
         }
         var _loc12_:uint = param1.readUnsignedShort();
         var _loc13_:uint = 0;
         while(_loc13_ < _loc12_)
         {
            _loc21_ = new FightCommonInformations();
            _loc21_.deserialize(param1);
            this.fights.push(_loc21_);
            _loc13_++;
         }
      }
   }
}
