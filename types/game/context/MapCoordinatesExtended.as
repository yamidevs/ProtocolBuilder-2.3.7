package com.ankamagames.dofus.network.types.game.context
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class MapCoordinatesExtended extends MapCoordinates implements INetworkType
   {
      
      public static const protocolId:uint = 176;
       
      
      public var mapId:int = 0;
      
      public function MapCoordinatesExtended()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 176;
      }
      
      public function initMapCoordinatesExtended(param1:int = 0, param2:int = 0, param3:int = 0) : MapCoordinatesExtended
      {
         super.initMapCoordinates(param1,param2);
         this.mapId = param3;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.mapId = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_MapCoordinatesExtended(param1);
      }
      
      public function serializeAs_MapCoordinatesExtended(param1:IDataOutput) : void
      {
         super.serializeAs_MapCoordinates(param1);
         param1.writeInt(this.mapId);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MapCoordinatesExtended(param1);
      }
      
      public function deserializeAs_MapCoordinatesExtended(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.mapId = param1.readInt();
      }
   }
}
