package com.rpgGame.coreData.role
{
    import com.game.engine3D.scene.render.RenderUnit3D;
    import com.game.engine3D.scene.render.vo.RenderParamData3D;
    import com.rpgGame.coreData.cfg.AttachEffectCfgData;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.clientConfig.Attach_effect;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import org.game.netCore.data.long;

    public class TrapInfo
    {
        private var _serverId : long;
        private var _id : int;
        private var _state : int = -1;
        private var _modelId : int;
        private var _x : Number;
        private var _y : Number;
        private var _normalEffect : RenderUnit3D;
        private var _effect : RenderUnit3D;
        
        public function TrapInfo(serverId : long, id : int, modelId : int, state : int, x : int, y : int) {
            this._serverId = serverId;
            this._id = id;
            this._modelId = modelId;
            this._state = state;
            this._x = x;
            this._y = y;
            
            var cfg : Attach_effect = AttachEffectCfgData.getInfo(this._modelId);
            var res : String = cfg["q_res_" + this._state];
            var rud : RenderParamData3D = new RenderParamData3D(
                this._id, 
                SceneCharType.TRAP, 
                ClientConfig.getEffect(res), 
                res);
            _normalEffect = RenderUnit3D.create(rud, true);
            _normalEffect.repeat = 0;
            _normalEffect.data = this;
            _normalEffect.setGroundXY(x, y);
            _normalEffect.rotationY = 0;
            _normalEffect.play(0);
        }
        
        private function changeEffect() : void {
            if (0 == this._state) {
                return;
            }
            var cfg : Attach_effect = AttachEffectCfgData.getInfo(this._modelId);
            var res : String = cfg["q_res_" + this._state];
            var rud : RenderParamData3D = new RenderParamData3D(
                this._id + this._state, 
                SceneCharType.TRAP, 
                ClientConfig.getEffect(res), 
                res);
            var trap : RenderUnit3D = RenderUnit3D.create(rud, true);
            trap.repeat = 1;
            trap.data = null;
            trap.setGroundXY(x, y);
            trap.rotationY = 0;
            trap.play(0);
            this._effect = trap;
        }
        
        public function getEffectId() : int {
            return this._id + this._state;
        }
        
        public function get state():int
        {
            return _state;
        }

        public function set state(value:int):void
        {
            if (this._state != value) {
                _state = value;
                this.changeEffect();
            }
        }

        public function get modelId():int
        {
            return _modelId;
        }

        public function set modelId(value:int):void
        {
            _modelId = value;
        }

        public function get serverId():long
        {
            return _serverId;
        }

        public function set serverId(value:long):void
        {
            _serverId = value;
        }

        public function get id():int
        {
            return _id;
        }

        public function set id(value:int):void
        {
            _id = value;
        }

        public function get x():Number
        {
            return _x;
        }

        public function set x(value:Number):void
        {
            _x = value;
        }

        public function get y():Number
        {
            return _y;
        }

        public function set y(value:Number):void
        {
            _y = value;
        }

        public function get normalEffect():RenderUnit3D
        {
            return _normalEffect;
        }

        public function get effect():RenderUnit3D
        {
            return _effect;
        }
    }
}