package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.loader.GlobalTexture;
	import com.game.engine3D.loader.GlobalTextureGroup;
	import com.game.engine3D.vo.FadeAlphaRectData;
	
	import flash.display.BlendMode;
	import flash.geom.ColorTransform;
	import flash.utils.Dictionary;
	
	import away3d.animators.AnimationSetBase;
	import away3d.animators.CameraVibrateAnimator;
	import away3d.animators.CompositeAnimator;
	import away3d.animators.IAnimator;
	import away3d.animators.IAnimatorOwner;
	import away3d.animators.SkeletonAnimator;
	import away3d.animators.data.CompositeAnimatorInstance;
	import away3d.animators.nodes.AnimationNodeBase;
	import away3d.cameras.iCamera3DAnimator;
	import away3d.containers.CompositeAnimatorGroup;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.SkeletonBone;
	import away3d.core.base.SubMesh;
	import away3d.entities.CompositeMesh;
	import away3d.entities.Mesh;
	import away3d.entities.SparticleMesh;
	import away3d.materials.ColorMaterial;
	import away3d.materials.MaterialBase;
	import away3d.materials.SinglePassMaterialBase;
	import away3d.materials.TextureMaterial;
	import away3d.materials.lightpickers.LightPickerBase;
	import away3d.materials.methods.BlendMethod;
	import away3d.materials.methods.EffectMethodBase;
	import away3d.materials.methods.FadeAlphaMethod;
	import away3d.textures.Texture2DBase;

	/**
	 *
	 * 渲染单元数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午1:26:38
	 *
	 */
	public class RenderUnitData
	{
		private var _type : String;
		private var _id : Number;
		private var _meshElements : Vector.<ObjectContainer3D>;
		private var _animatorElements : Vector.<CompositeMesh>;
		private var _meshes : Vector.<Mesh>;
		private var _effectMethods : Vector.<EffectMethodBase>;
		private var _sparticleMeshes : Vector.<SparticleMesh>;
		private var _rootObj3ds : Vector.<ObjectContainer3D>;
		private var _childObj3ds : Vector.<ObjectContainer3D>;
		private var _compositeUnitDatas : Vector.<RenderUnitData>;
		private var _meshByName : Dictionary;
		private var _sparticleMeshByName : Dictionary;
		private var _objByName : Dictionary;
		private var _compositeAnimatorGroupByName : Dictionary;
		private var _layerTypeByName : Dictionary;
		private var _visibleByName : Dictionary;
		private var _childrenWithAnimatByRoot : Dictionary;
		private var _materialMap : Dictionary;
		private var _materialLightPickerMap : Dictionary;
		private var _targetMeterialMap : Dictionary;
		private var _camera3DAnimators : Vector.<iCamera3DAnimator>;
		private var _independentMaterialMap : Dictionary;
		private var _independentColorTransform : ColorTransform;
		//private var _overrideMaterialProps : OverrideMaterialProps;
		/** 灯光 **/
		private var _lightPicker : LightPickerBase;
		private var _shareMaterials : Boolean;
		private var _hasSkeletonAnimator : Boolean;
		private var _lastOneRemoveMethodData : MethodData;
		private var _methodDatas : Vector.<MethodData>;
		private var _independentTexture : Texture2DBase;
		private var _independentMaterialName : String;
		private var _textureUrl : String;
		private var _useIndependentColor : Boolean;
		private var _blendMaterialName : String;
		private var _blendMaskUrl : String;
		private var _blendUrl : String;
		private var _blendMethodData : MethodData;
		private var _blendBias : Number;
		private var _fadeAlphaUrl : String;
		private var _fadeAlphaMethodData : MethodData;
		private var _fadeAlphaRect : FadeAlphaRectData;
		private var _onFadeAlphaValidate : Function;

		public function RenderUnitData(type : String, id : Number)
		{
			_type = type;
			_id = id;
			_shareMaterials = false;
			_hasSkeletonAnimator = false;
		}

		public function setResourceData(resData : RenderResourceData) : void
		{
			_lightPicker = null;
			_shareMaterials = true;
			_hasSkeletonAnimator = false;
			_meshes = new Vector.<Mesh>();
			_sparticleMeshes = new Vector.<SparticleMesh>();
			_camera3DAnimators = new Vector.<iCamera3DAnimator>();
			_meshElements = resData.cloneMeshElements();
			_animatorElements = resData.cloneAnimatorElements();
			_effectMethods = resData.getMethods();
			_rootObj3ds = new Vector.<ObjectContainer3D>();
			_childObj3ds = new Vector.<ObjectContainer3D>();
			_compositeUnitDatas = new Vector.<RenderUnitData>();
			_meshByName = new Dictionary(true);
			_sparticleMeshByName = new Dictionary(true);
			_objByName = new Dictionary(true);
			_compositeAnimatorGroupByName = new Dictionary(true);
			_childrenWithAnimatByRoot = new Dictionary(true);
			_layerTypeByName = resData.layerTypeByName;
			_visibleByName = resData.visibleByName;
			_independentMaterialMap = new Dictionary(true);
			_independentColorTransform = new ColorTransform();
//			_overrideMaterialProps = new OverrideMaterialProps();
//			_overrideMaterialProps.blendMode = BlendMode.LAYER;
//			_overrideMaterialProps.overrideBlendMode = true;
//			_overrideMaterialProps.colorTransform = _independentColorTransform;
			_methodDatas = null;
			_fadeAlphaUrl = null;
			_fadeAlphaRect = null;
			_independentMaterialName = null;
			_independentTexture = null;
			_textureUrl = null;
			_useIndependentColor = false;
			_blendMethodData = null;
			_fadeAlphaMethodData = null;
			_onFadeAlphaValidate = null;
			//_overrideMaterialProps.rimLightStrength = 0.4;

			_targetMeterialMap = null;
			_materialMap = new Dictionary(true);
			_materialLightPickerMap = new Dictionary(true);
			var materialMap : Dictionary = resData.materialMap;
			var materialLightPickerMap : Dictionary = resData.materialLightPickerMap;
			for (var name : String in materialMap)
			{
				var materialName : String = getUnitMaterialName(name);
				var material : MaterialBase = materialMap[name];
				_materialMap[materialName] = new MaterialData(_type, _id, material.name, material);
				var lightPicker : LightPickerBase = materialLightPickerMap[name];
				_materialLightPickerMap[materialName] = lightPicker;
			}

			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					addRootElement(meshElement);
				}
			}
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					addRootElement(animatElement);
				}
			}
		}

		public function getUnitMaterialName(name : String) : String
		{
			return _type + "_" + _id + "_" + name;
		}

		private function addRootElement(element : ObjectContainer3D) : void
		{
			if (element is CompositeMesh)
			{
				//(element as CompositeMesh).overrideMaterialProps = _overrideMaterialProps;
			}
			else if (element is SparticleMesh)
			{
				_sparticleMeshByName[element.name] = element;
				_sparticleMeshes.push(SparticleMesh(element));
			}
			else if (element is Mesh)
			{
				//(element as Mesh).overrideMaterialProps = _overrideMaterialProps;
				_meshByName[element.name] = element;
				_meshes.push(Mesh(element));
			}
			else if (element is CompositeAnimatorGroup)
			{
				_compositeAnimatorGroupByName[element.name] = element;
				addCameraAnimator(CompositeAnimator(CompositeAnimatorGroup(element).animator));
			}

			_rootObj3ds.push(element);
			addChildObj(element);
			if (element is IAnimatorOwner)
			{
				if ((element as IAnimatorOwner).animator is SkeletonAnimator)
				{
					_hasSkeletonAnimator = true;
				}
			}
			var numChildren : int = element.numChildren;
			for (var i : int = 0; i < numChildren; i++)
			{
				addChildWithAnimat(element.getChildAt(i), element);
			}
		}

		private function addChildObj(element : ObjectContainer3D) : void
		{
			_objByName[element.name] = element;
			var numChildren : int = element.numChildren;
			for (var i : int = 0; i < numChildren; i++)
			{
				var child : ObjectContainer3D = element.getChildAt(i);
				_childObj3ds.push(child);
				addChildObj(child);
			}
		}

		private function addChildWithAnimat(element : ObjectContainer3D, root : ObjectContainer3D) : void
		{
			if (element is IAnimatorOwner && (element as IAnimatorOwner).animator)
			{
				var animatChildren : Array = _childrenWithAnimatByRoot[root];
				if (!animatChildren)
				{
					animatChildren = [];
					_childrenWithAnimatByRoot[root] = animatChildren;
				}
				animatChildren.push(element);
				if (element is CompositeAnimatorGroup)
				{
					_compositeAnimatorGroupByName[element.name] = element;
					addCameraAnimator(CompositeAnimator(CompositeAnimatorGroup(element).animator));
				}
			}
			var numChildren : int = element.numChildren;
			for (var i : int = 0; i < numChildren; i++)
			{
				addChildWithAnimat(element.getChildAt(i), root);
			}
		}

		private function addCameraAnimator(animator : CompositeAnimator) : void
		{
			if (!animator)
			{
				return;
			}
			for each (var instance : CompositeAnimatorInstance in animator.subAnimators)
			{
				if (instance.animator is CameraVibrateAnimator)
				{
					_camera3DAnimators.push(instance.animator as CameraVibrateAnimator);
				}
				else if (instance.animator is CompositeAnimator)
				{
					addCameraAnimator(instance.animator as CompositeAnimator);
				}
			}
		}

		/*private function getParticles(parent : ObjectContainer3D, particles : Vector.<ParticleGroup>) : void
		{
			for (var i : int = 0; i < parent.numChildren; i++)
			{
				var child : ObjectContainer3D = parent.getChildAt(i);
				if (child is ParticleGroup)
				{
					particles.push(child);
				}
				else if (child is ObjectContainer3D)
				{
					getParticles(child, particles);
				}
			}
		}*/

		public function switchMaterialsToIndependent(independentTexture : Texture2DBase, independentMaterialName : String) : void
		{
			initIndependentMaterials();
			if (_independentMaterialMap == null)
			{
				return;
			}
			for (var name : String in _independentMaterialMap)
			{
				var material : TextureMaterial = (_independentMaterialMap[name] as MaterialData).material as TextureMaterial;
				if (independentTexture)
				{
					if (!independentMaterialName || (material.name == independentMaterialName))
					{
						material.texture = independentTexture;
					}
					else
					{
						material.texture = ((_materialMap[name] as MaterialData).material as TextureMaterial).texture;
					}
				}
				else
				{
					material.texture = ((_materialMap[name] as MaterialData).material as TextureMaterial).texture;
				}
			}
			_targetMeterialMap = _independentMaterialMap;
			validateMeterials();
		}

		public function switchMaterialsToShare() : void
		{
			_targetMeterialMap = _materialMap;
			validateMeterials();
			if (_animatorElements)
			{
				for each (var compositeMesh : CompositeMesh in _animatorElements)
				{
					compositeMesh.overrideMaterialProps = null;
				}
			}
			if (_meshes)
			{
				for each (var mesh : Mesh in _meshes)
				{
					mesh.overrideMaterialProps = null;
				}
			}
		}

		/**
		 * 由美术来确定是否显示出来，EntityLayerType.DEFAULT可能会被勾选掉 L.L.M.Sunny
		 * @param name
		 * @return
		 *
		 */
		public function getLayerType(name : String) : uint
		{
			return uint(_layerTypeByName[name]);
		}

		public function getVisible(name : String) : Boolean
		{
			return Boolean(_visibleByName[name]);
		}

		public function getObj(name : String) : ObjectContainer3D
		{
			return _objByName[name];
		}

		public function getChildrenWithAnimat(rootElement : ObjectContainer3D) : Array
		{
			var animatChildren : Array = _childrenWithAnimatByRoot[rootElement];
			return animatChildren;
		}

		public function getMesh(name : String) : Mesh
		{
			return _meshByName[name];
		}

		public function getSparticleMesh(name : String) : SparticleMesh
		{
			return _sparticleMeshByName[name];
		}

		public function getCompositeAnimatorGroup(name : String) : CompositeAnimatorGroup
		{
			return _compositeAnimatorGroupByName[name];
		}

		/**
		 * 获得模型上指定名称集的容器集
		 * @param name
		 * @return
		 */
		public function getChildsByNames(names : Array) : Array
		{
			var childsArr : Array = [];
			if (_objByName)
			{
				for (var objName : String in _objByName)
				{
					if (names.indexOf(objName) > -1)
					{
						var obj : ObjectContainer3D = _objByName[objName];
						childsArr.push(obj);
					}
				}
			}
			return childsArr;
		}

		/**
		 * 获得模型上指定名称的容器
		 * @param name
		 * @return
		 */
		public function getChildByName(name : String) : ObjectContainer3D
		{
			var child : ObjectContainer3D;
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					if (animatElement.name == name)
					{
						return animatElement;
					}
					child = getChild(animatElement, name);
					if (child)
					{
						return child;
					}
				}
			}
			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					if (meshElement.name == name)
					{
						return meshElement;
					}
					child = getChild(meshElement, name);
					if (child)
					{
						return child;
					}
				}
			}
			return null;
		}

		private function getChild(parent : ObjectContainer3D, name : String) : ObjectContainer3D
		{
			for (var i : int = 0; i < parent.numChildren; i++)
			{
				var child : ObjectContainer3D = parent.getChildAt(i);
				if (child.name == name)
				{
					return child;
				}
				child = getChild(child, name);
				if (child)
				{
					return child;
				}
			}
			return null;
		}

		/**
		 * 获取模型上指定名称的骨骼
		 * @param value
		 * @return
		 */
		public function getBoneByName(name : String) : SkeletonBone
		{
			if (!_meshes)
				return null;
			for each (var mesh : Mesh in _meshes)
			{
				var animator : IAnimator = null;
				if (mesh is IAnimatorOwner)
				{
					animator = (mesh as IAnimatorOwner).animator;
				}
				if (animator is SkeletonAnimator)
				{
					var index : int = mesh.getBoneIndex(name);
					if (index >= 0)
					{
						var bone : SkeletonBone = mesh.getBone(index);
						return bone;
					}
				}
			}
			return null;
		}

		public function get meshElements() : Vector.<ObjectContainer3D>
		{
			return _meshElements;
		}

		public function get effectMethods() : Vector.<EffectMethodBase>
		{
			return _effectMethods;
		}

		public function get animatorElements() : Vector.<CompositeMesh>
		{
			return _animatorElements;
		}

		public function get meshes() : Vector.<Mesh>
		{
			return _meshes;
		}

		public function get sparticleMeshes() : Vector.<SparticleMesh>
		{
			return _sparticleMeshes;
		}

		public function get rootObj3ds() : Vector.<ObjectContainer3D>
		{
			return _rootObj3ds;
		}

		public function get childObj3ds() : Vector.<ObjectContainer3D>
		{
			return _childObj3ds;
		}

		public function get camera3DAnimators() : Vector.<iCamera3DAnimator>
		{
			return _camera3DAnimators;
		}

//		public function get particles() : Vector.<ParticleGroup>
//		{
//			return _particles;
//		}

		public function hasAnimation(name : String) : Boolean
		{
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					if (animatElement.animator && animatElement.animator.animationSet)
						return animatElement.animator.animationSet.hasAnimation(name);
				}
			}
			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					if (meshElement is IAnimatorOwner && (meshElement as IAnimatorOwner).animator && (meshElement as IAnimatorOwner).animator.animationSet)
						return (meshElement as IAnimatorOwner).animator.animationSet.hasAnimation(name);
				}
			}
			return false;
		}

		public function getAnimations() : Vector.<AnimationNodeBase>
		{
			var animationSet : AnimationSetBase;
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					if (animatElement.animator)
					{
						animationSet = animatElement.animator.animationSet as AnimationSetBase;
						if (animationSet)
							return animationSet.animations;
					}
				}
			}
			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					if (meshElement is IAnimatorOwner && (meshElement as IAnimatorOwner).animator)
					{
						animationSet = (meshElement as IAnimatorOwner).animator.animationSet as AnimationSetBase;
						if (animationSet)
							return animationSet.animations;
					}
				}
			}
			return null;
		}

		public function getAnimation(name : String) : AnimationNodeBase
		{
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					if (animatElement.animator && animatElement.animator.animationSet)
						return animatElement.animator.animationSet.getAnimation(name);
				}
			}
			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					if (meshElement is IAnimatorOwner && (meshElement as IAnimatorOwner).animator && (meshElement as IAnimatorOwner).animator.animationSet)
						return (meshElement as IAnimatorOwner).animator.animationSet.getAnimation(name);
				}
			}
			return null;
		}

		public function getAnimationDuration(name : String) : uint
		{
			var node : AnimationNodeBase;
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					if (animatElement.animator)
					{
						if (!animatElement.animator.animationSet || !animatElement.animator.animationSet.hasAnimation(name))
						{
							return animatElement.animator.duration;
						}
						node = animatElement.animator.animationSet.getAnimation(name); // SkeletonClipNode;
						return node.duration;
					}
				}
			}
			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					if (meshElement is IAnimatorOwner && (meshElement as IAnimatorOwner).animator)
					{
						if (!(meshElement as IAnimatorOwner).animator.animationSet || !(meshElement as IAnimatorOwner).animator.animationSet.hasAnimation(name))
						{
							return (meshElement as IAnimatorOwner).animator.duration;
						}
						node = (meshElement as IAnimatorOwner).animator.animationSet.getAnimation(name); // SkeletonClipNode;
						return node.duration;
					}
				}
			}
			return 0;
		}

		public function getAnimationExtrasData(name : String, fieldName : String) : String
		{
			var node : AnimationNodeBase;
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					if (animatElement.animator)
					{
						if (!animatElement.animator.animationSet || !animatElement.animator.animationSet.hasAnimation(name))
							return null;
						node = animatElement.animator.animationSet.getAnimation(name); // SkeletonClipNode;
						if (node && node.extras && node.extras.hasOwnProperty(fieldName))
							return node.extras[fieldName];
						return null;
					}
				}
			}
			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					if (meshElement is IAnimatorOwner && (meshElement as IAnimatorOwner).animator)
					{
						if (!(meshElement as IAnimatorOwner).animator.animationSet || !(meshElement as IAnimatorOwner).animator.animationSet.hasAnimation(name))
							return null;
						node = (meshElement as IAnimatorOwner).animator.animationSet.getAnimation(name); // SkeletonClipNode;
						if (node && node.extras && node.extras.hasOwnProperty(fieldName))
							return node.extras[fieldName];
						return null;
					}
				}
			}
			return null;
		}

		private function restoreLayerType() : void
		{
			var name : String;
			var mesh : Mesh;
			var layerType : uint;
			if (_meshByName)
			{
				for (name in _meshByName)
				{
					mesh = _meshByName[name];
					layerType = uint(_layerTypeByName[name]);
					mesh.layerType = layerType;
				}
			}
			if (_sparticleMeshByName)
			{
				for (name in _sparticleMeshByName)
				{
					mesh = _sparticleMeshByName[name];
					layerType = uint(_layerTypeByName[name]);
					mesh.layerType = layerType;
				}
			}
		}

		private function restoreVisible() : void
		{
			if (!_objByName)
			{
				return;
			}
			for (var name : String in _objByName)
			{
				var obj : ObjectContainer3D = _objByName[name];
				var objVisible : Boolean = Boolean(_visibleByName[name]);
				obj.visible = objVisible;
			}
		}

		private function restoreMaterials() : void
		{
			removeAllMethods();
			switchMaterialsToShare();
			_shareMaterials = true;
			_independentColorTransform.redMultiplier = 1;
			_independentColorTransform.greenMultiplier = 1;
			_independentColorTransform.blueMultiplier = 1;
			_independentColorTransform.alphaMultiplier = 1;
			_useIndependentColor = false;
		}

		public function restore() : void
		{
			restoreLayerType();
			restoreVisible();
			restoreMaterials();
		}

		public function initIndependentMaterials() : void
		{
			if (!_independentMaterialMap)
			{
				return;
			}
			for (var name : String in _materialMap)
			{
				if (!_independentMaterialMap[name])
				{
					var materialData : MaterialData = _materialMap[name];
					var orgMaterial : SinglePassMaterialBase = materialData.material as SinglePassMaterialBase;
					addIndependentMaterial(name, orgMaterial);
				}
			}
		}

		private function addIndependentMaterial(name : String, orgMaterial : SinglePassMaterialBase) : void
		{
			if (!_independentMaterialMap || !orgMaterial)
			{
				return;
			}
			var material : SinglePassMaterialBase;
			if (orgMaterial is TextureMaterial)
			{
				material = new TextureMaterial();
			}
			else if (orgMaterial is ColorMaterial)
			{
				material = new ColorMaterial();
			}
			if (material)
			{
				material.copyFrom(orgMaterial);
				if (GlobalConfig.use25DMap)
					material.blendMode = BlendMode.LAYER;
				material.colorTransform = _independentColorTransform;
				material.diffuseAcc = orgMaterial.diffuseAcc;
				material.lightPicker = orgMaterial.lightPicker ? _lightPicker : null;
				_independentMaterialMap[name] = new MaterialData(_type, _id, material.name, material);
			}
		}

		public function addCompositeMaterials(renderUnitData : RenderUnitData) : Boolean
		{
			if (!_compositeUnitDatas || renderUnitData == this)
			{
				return false;
			}
			var index : int = _compositeUnitDatas.indexOf(renderUnitData);
			if (index < 0)
			{
				_compositeUnitDatas.push(renderUnitData);
				return true;
			}
			return false;
		}

		/**
		 * 设置拾取光（灯光拾取器）
		 * @param value
		 *
		 */
		public function set lightPicker(value : LightPickerBase) : void
		{
			if (_lightPicker == value)
				return;
			_lightPicker = value;
			validateLightPicker();
		}

		public function set shareMaterials(value : Boolean) : void
		{
			if (_shareMaterials == value)
				return;
			_shareMaterials = value;
		}

		public function get hasSkeletonAnimator() : Boolean
		{
			return _hasSkeletonAnimator;
		}

		public function validateMeterials() : void
		{
			if (_animatorElements)
			{
				for each (var compositeMesh : CompositeMesh in _animatorElements)
				{
					validateCompositeMeshMeterials(compositeMesh);
				}
			}
			if (_meshes)
			{
				for each (var mesh : Mesh in _meshes)
				{
					validateMeshMeterials(mesh);
				}
			}
		}

		private function validateMeshMeterials(mesh : Mesh) : void
		{
			var subMeshes : Vector.<SubMesh> = mesh.subMeshes;
			var subMaterial : MaterialBase;
			var material : MaterialBase;
			var subLen : int = subMeshes.length;
			for (var i : int = 0; i < subLen; i++)
			{
				var subMesh : SubMesh = subMeshes[i];
				material = subMesh.material;
				var materialData : MaterialData = _targetMeterialMap[getUnitMaterialName(material.name)]
				subMaterial = materialData.material;
				if (subMaterial)
				{
					subMesh.material = subMaterial;
						//subMaterial.depthCompareMode = _depthCompareMode;//暂时不用了，过段时间删掉。
				}
			}
		}

		private function validateCompositeMeshMeterials(compositeMesh : CompositeMesh) : void
		{
			if (!compositeMesh)
			{
				return;
			}
			if (!_targetMeterialMap)
			{
				return;
			}
			var subMeshes : Vector.<SubMesh> = compositeMesh.subMeshes;
			if (!subMeshes)
			{
				return;
			}
			var subMaterial : MaterialBase;
			var material : MaterialBase;
			var subLen : int = subMeshes.length;
			for (var i : int = 0; i < subLen; i++)
			{
				var subMesh : SubMesh = subMeshes[i];
				if (!subMesh)
				{
					continue;
				}
				material = subMesh.material;
				if (!material)
				{
					continue;
				}
				var materialData : MaterialData = _targetMeterialMap[getUnitMaterialName(material.name)];
				subMaterial = materialData ? materialData.material : null;
				if (subMaterial && material.name == subMaterial.name)
				{
					subMesh.material = subMaterial;
				}
				for each (var unitData : RenderUnitData in _compositeUnitDatas)
				{
					if (!unitData._targetMeterialMap)
					{
						continue;
					}
					materialData = unitData._targetMeterialMap[unitData.getUnitMaterialName(material.name)];
					subMaterial = materialData ? materialData.material : null;
					if (subMaterial && material.name == subMaterial.name)
					{
						subMesh.material = subMaterial;
					}
				}
			}
		}

		public function setMethods(methodDatas : Vector.<MethodData>) : void
		{
			clearAllMethods();
			_methodDatas = methodDatas.slice();
			updateMaterials();
		}

		public function setIndependentTexture(url : String, materialName : String = null) : void
		{
			if (_textureUrl == url)
				return;
			unloadIndependentTexture();
			_textureUrl = url;
			_independentMaterialName = materialName;
			GlobalTexture.addTexture(_textureUrl, onIndependentTextureComplete);
		}

		private function onIndependentTextureComplete(globalTexture : GlobalTexture) : void
		{
			GlobalTexture.removeTextureCallBack(_textureUrl, onIndependentTextureComplete);
			_independentTexture = globalTexture.texture;
			updateMaterials();
		}

		public function restoreTexture() : void
		{
			unloadIndependentTexture();
			updateMaterials();
		}

		private function unloadIndependentTexture() : void
		{
			if (_textureUrl)
			{
				GlobalTexture.removeTextureCallBack(_textureUrl, onIndependentTextureComplete);
				_textureUrl = null;
			}
			_independentTexture = null;
			_independentMaterialName = null;
		}

		public function updateMaterials() : void
		{
			if (_methodDatas)
			{
				if (!_shareMaterials || _methodDatas.length > 0 || _blendMethodData || _fadeAlphaMethodData || _independentTexture || _useIndependentColor)
				{
					switchMaterialsToIndependent(_independentTexture, _independentMaterialName);
					if (_independentMaterialMap)
					{
						for each (var materialData : MaterialData in _independentMaterialMap)
						{
							var singlePassMaterial : SinglePassMaterialBase = materialData.material as SinglePassMaterialBase;
							if (_lastOneRemoveMethodData)
							{
								if (singlePassMaterial.hasMethod(_lastOneRemoveMethodData.method))
								{
									singlePassMaterial.removeMethod(_lastOneRemoveMethodData.method);
								}
							}
							for each (var methodData : MethodData in _methodDatas)
							{
								if (!singlePassMaterial.hasMethod(methodData.method))
								{
									if (!methodData.materialNames || (methodData.materialNames.indexOf(singlePassMaterial.name) > -1))
									{
										singlePassMaterial.addMethod(methodData.method);
									}
								}
							}
							if (_blendMethodData)
							{
								if (!singlePassMaterial.hasMethod(_blendMethodData.method))
								{
									if (!_blendMethodData.materialNames || (_blendMethodData.materialNames.indexOf(singlePassMaterial.name) > -1))
									{
										singlePassMaterial.addMethod(_blendMethodData.method);
									}
								}
							}
							if (_fadeAlphaMethodData)
							{
								if (!singlePassMaterial.hasMethod(_fadeAlphaMethodData.method))
								{
									singlePassMaterial.addMethod(_fadeAlphaMethodData.method);
								}
							}
						}
					}
					_lastOneRemoveMethodData = null;
				}
				else
				{
					switchMaterialsToShare();
				}
				for each (var unitData : RenderUnitData in _compositeUnitDatas)
				{
					unitData.updateMaterials();
				}
			}
		}

		public function addMethod(methodData : MethodData) : void
		{
			if (_methodDatas && _methodDatas.indexOf(methodData) == -1)
			{
				_methodDatas.push(methodData);
				if (_lastOneRemoveMethodData == methodData)
				{
					_lastOneRemoveMethodData = null;
				}
				updateMaterials();
			}
		}

		public function removeMethod(methodData : MethodData) : void
		{
			if (_methodDatas && _methodDatas.length > 0)
			{
				var index : int = _methodDatas.indexOf(methodData);
				if (index != -1)
				{
					_methodDatas.splice(index, 1);
					doRemoveMethod(methodData);
					updateMaterials();
				}
			}
		}

		private function doRemoveMethod(methodData : MethodData) : void
		{
			if (_independentMaterialMap)
			{
				var materialData : MaterialData;
				var singlePassMaterial : SinglePassMaterialBase;
				if (methodData == _blendMethodData || methodData == _fadeAlphaMethodData)
				{
					for each (materialData in _independentMaterialMap)
					{
						singlePassMaterial = SinglePassMaterialBase(materialData.material);
						if (singlePassMaterial && singlePassMaterial.hasMethod(methodData.method))
						{
							singlePassMaterial.removeMethod(methodData.method);
						}
					}
				}
				else if (_methodDatas.length > 0)
				{
					for each (materialData in _independentMaterialMap)
					{
						singlePassMaterial = SinglePassMaterialBase(materialData.material);
						if (singlePassMaterial && singlePassMaterial.hasMethod(methodData.method))
						{
							singlePassMaterial.removeMethod(methodData.method);
						}
					}
				}
				else
				{
					_lastOneRemoveMethodData = methodData;
				}
			}
		}

		private function clearAllMethods() : void
		{
			if (_methodDatas)
			{
				if (_independentMaterialMap)
				{
					for each (var materialData : MaterialData in _independentMaterialMap)
					{
						for each (var methodData : MethodData in _methodDatas)
						{
							var singlePassMaterial : SinglePassMaterialBase = materialData.material as SinglePassMaterialBase;
							if (singlePassMaterial && singlePassMaterial.hasMethod(methodData.method))
							{
								singlePassMaterial.removeMethod(methodData.method);
							}
						}
					}
				}
				_methodDatas.length = 0;
			}
			_lastOneRemoveMethodData = null;
		}

		/**清除所有方法*/
		public function removeAllMethods() : void
		{
			unloadIndependentTexture();
			if (_blendMethodData)
			{
				doRemoveMethod(_blendMethodData);
			}
			unloadBlendTexture();
			if (_fadeAlphaMethodData)
			{
				doRemoveMethod(_fadeAlphaMethodData);
			}
			unloadFadeAlphaTexture();
			clearAllMethods();
			updateMaterials();
		}

		private function validateLightPicker() : void
		{
			if (!_materialMap)
				return;
			var i : int;
			var len : int;
			var material : MaterialBase;
			var materialData : MaterialData;
			for (var name : String in _materialMap)
			{
				if (_shareMaterials)
				{
					materialData = _materialMap[name] as MaterialData;
					material = materialData ? materialData.material : null;
					if (material && _materialLightPickerMap.hasOwnProperty(name))
					{
						material.lightPicker = _materialLightPickerMap[name] ? _lightPicker : null;
					}
				}
				if (_independentMaterialMap)
				{
					materialData = _independentMaterialMap[name] as MaterialData;
					material = materialData ? materialData.material : null;
					if (material && _materialLightPickerMap.hasOwnProperty(name))
					{
						material.lightPicker = _materialLightPickerMap[name] ? _lightPicker : null;
					}
				}
			}
		}

		public function setIndependentColorTransform(value : ColorTransform) : void
		{
			_independentColorTransform.redMultiplier = value.redMultiplier;
			_independentColorTransform.greenMultiplier = value.greenMultiplier;
			_independentColorTransform.blueMultiplier = value.blueMultiplier;
			_independentColorTransform.alphaMultiplier = value.alphaMultiplier;
			_independentColorTransform.redOffset = value.redOffset;
			_independentColorTransform.greenOffset = value.greenOffset;
			_independentColorTransform.blueOffset = value.blueOffset;
			_independentColorTransform.alphaOffset = value.alphaOffset;
			if (!_useIndependentColor)
			{
				_useIndependentColor = true;
				updateMaterials();
			}
		}

		public function restoreColor() : void
		{
			if (_useIndependentColor)
			{
				_independentColorTransform.redMultiplier = 1;
				_independentColorTransform.greenMultiplier = 1;
				_independentColorTransform.blueMultiplier = 1;
				_independentColorTransform.alphaMultiplier = 1;
				setIndependentColorTransform(_independentColorTransform);
				_useIndependentColor = false;
				updateMaterials();
			}
		}

		private function unloadBlendTexture() : void
		{
			if (_blendMaskUrl && _blendUrl)
			{
				GlobalTextureGroup.removeGroupTextureCallBack([_blendMaskUrl, _blendUrl], onBlendTexturesComplete);
				_blendMaskUrl = null;
				_blendUrl = null;
			}
			if (_blendMethodData)
			{
				_blendMethodData.method.dispose();
				_blendMethodData = null;
			}
			_blendBias = 0;
			_blendMaterialName = null;
		}

		public function addBlend(blendMaskUrl : String, blendUrl : String, blendMaterialName : String = null) : void
		{
			if (!blendMaskUrl || !blendUrl)
				return;
			if (_blendMaskUrl == blendMaskUrl && _blendUrl == blendUrl)
				return;
			if (_blendMethodData)
			{
				doRemoveMethod(_blendMethodData);
			}
			unloadBlendTexture();
			updateMaterials();
			_blendMaskUrl = blendMaskUrl;
			_blendUrl = blendUrl;
			_blendMaterialName = blendMaterialName;
			_blendBias = 0;
			GlobalTextureGroup.addTextureGroup([_blendMaskUrl, _blendUrl], onBlendTexturesComplete);
		}

		public function set blendBias(value : Number) : void
		{
			_blendBias = value;
			if (_blendMethodData)
			{
				(_blendMethodData.method as BlendMethod).blendBias = _blendBias;
			}
		}

		private function onBlendTexturesComplete(globalTextureGroup : GlobalTextureGroup) : void
		{
			if (!_blendMaskUrl || !_blendUrl)
				return;
			GlobalTextureGroup.removeGroupTextureCallBack([_blendMaskUrl, _blendUrl], onBlendTexturesComplete);
			var blendMask : Texture2DBase = globalTextureGroup.getTexture(_blendMaskUrl).texture;
			var blendTexture : Texture2DBase = globalTextureGroup.getTexture(_blendUrl).texture;
			if (blendMask && blendTexture)
			{
				var blendMethod : BlendMethod = new BlendMethod(blendMask, blendTexture, _blendBias);
				_blendMethodData = new MethodData(blendMethod, [_blendMaterialName]);
				updateMaterials();
			}
		}

		public function removeBlend() : void
		{
			if (_blendMethodData)
			{
				doRemoveMethod(_blendMethodData);
			}
			unloadBlendTexture();
			updateMaterials();
		}

		public function get fadeAlphaMethodData() : MethodData
		{
			return _fadeAlphaMethodData;
		}

		public function addFadeAlpha(url : String, rect : FadeAlphaRectData, onFadeAlphaValidate : Function) : void
		{
			if (!url)
				return;
			if (_fadeAlphaUrl == url)
				return;
			if (_fadeAlphaMethodData)
			{
				doRemoveMethod(_fadeAlphaMethodData);
			}
			unloadFadeAlphaTexture();
			updateMaterials();
			_fadeAlphaUrl = url;
			_fadeAlphaRect = rect;
			_onFadeAlphaValidate = onFadeAlphaValidate;
			GlobalTexture.addTexture(_fadeAlphaUrl, onFadeAlphaTextureComplete);
		}

		public function setFadeAlphaRect(rect : FadeAlphaRectData) : void
		{
			if (_fadeAlphaRect == rect)
			{
				return;
			}
			if (_fadeAlphaMethodData)
			{
				var fadeX : int = rect.fadeX;
				var fadeY : int = rect.fadeY;
				var fadeWidth : int = rect.fadeWidth > 0 ? rect.fadeWidth : _fadeAlphaRect.fadeWidth;
				var fadeHeight : int = rect.fadeHeight > 0 ? rect.fadeHeight : _fadeAlphaRect.fadeHeight;
				_fadeAlphaRect = new FadeAlphaRectData(fadeX, fadeY, fadeWidth, fadeHeight);
				(_fadeAlphaMethodData.method as FadeAlphaMethod).setFadeRectangle(_fadeAlphaRect.fadeX, _fadeAlphaRect.fadeY, _fadeAlphaRect.fadeWidth, _fadeAlphaRect.fadeHeight);
			}
			else
			{
				_fadeAlphaRect = rect;
			}
		}

		private function unloadFadeAlphaTexture() : void
		{
			if (_fadeAlphaUrl)
			{
				GlobalTexture.removeTextureCallBack(_fadeAlphaUrl, onFadeAlphaTextureComplete);
				_fadeAlphaUrl = null;
			}
			if (_fadeAlphaMethodData)
			{
				_fadeAlphaMethodData.method.dispose();
				_fadeAlphaMethodData = null;
			}
			_fadeAlphaRect = null;
		}

		public function removeFadeAlpha() : void
		{
			if (_fadeAlphaMethodData)
			{
				doRemoveMethod(_fadeAlphaMethodData);
			}
			unloadFadeAlphaTexture();
			updateMaterials();
			if (_onFadeAlphaValidate != null)
			{
				_onFadeAlphaValidate();
				_onFadeAlphaValidate = null;
			}
		}

		private function onFadeAlphaTextureComplete(globalTexture : GlobalTexture) : void
		{
			if (!_fadeAlphaUrl)
				return;
			GlobalTexture.removeTextureCallBack(_fadeAlphaUrl, onFadeAlphaTextureComplete);
			if (globalTexture.texture)
			{
				var fadeAlphaMethod : FadeAlphaMethod = new FadeAlphaMethod(globalTexture.texture);
				var fadeX : int;
				var fadeY : int;
				var fadeWidth : int;
				var fadeHeight : int;
				if (_fadeAlphaRect)
				{
					fadeX = _fadeAlphaRect.fadeX;
					fadeY = _fadeAlphaRect.fadeY;
					fadeWidth = _fadeAlphaRect.fadeWidth > 0 ? _fadeAlphaRect.fadeWidth : globalTexture.texture.width;
					fadeHeight = _fadeAlphaRect.fadeHeight > 0 ? _fadeAlphaRect.fadeHeight : globalTexture.texture.height;
				}
				else
				{
					fadeX = 0;
					fadeY = 0;
					fadeWidth = globalTexture.texture.width;
					fadeHeight = globalTexture.texture.height;
				}
				_fadeAlphaRect = new FadeAlphaRectData(fadeX, fadeY, fadeWidth, fadeHeight);
				fadeAlphaMethod.setFadeRectangle(_fadeAlphaRect.fadeX, _fadeAlphaRect.fadeY, _fadeAlphaRect.fadeWidth, _fadeAlphaRect.fadeHeight);
				_fadeAlphaMethodData = new MethodData(fadeAlphaMethod);
				updateMaterials();
				if (_onFadeAlphaValidate != null)
				{
					_onFadeAlphaValidate();
					_onFadeAlphaValidate = null;
				}
			}
		}

		public function dispose() : void
		{
			removeAllMethods();
			_methodDatas = null;
			if (_animatorElements)
			{
				for each (var animatElement : CompositeMesh in _animatorElements)
				{
					animatElement.removeAllUnits();
					if (animatElement.parent)
					{
						animatElement.parent.removeChild(animatElement);
					}
					animatElement.dispose();
				}
				_animatorElements.length = 0;
				_animatorElements = null;
			}
			if (_meshElements)
			{
				for each (var meshElement : ObjectContainer3D in _meshElements)
				{
					meshElement.hookingJointName = null;
					if (meshElement.parent)
					{
						meshElement.parent.removeChild(meshElement);
					}
					meshElement.dispose();
				}
				_meshElements.length = 0;
				_meshElements = null;
			}
			if (_meshes)
			{
				_meshes.length = 0;
				_meshes = null;
			}
			if (_sparticleMeshes)
			{
				_sparticleMeshes.length = 0;
				_sparticleMeshes = null;
			}
			if (_childObj3ds)
			{
				_childObj3ds.length = 0;
				_childObj3ds = null;
			}
			if (_rootObj3ds)
			{
				_rootObj3ds.length = 0;
				_rootObj3ds = null;
			}
			if (_compositeUnitDatas)
			{
				_compositeUnitDatas.length = 0;
				_compositeUnitDatas = null;
			}
			var name : String;
			if (_meshByName)
			{
				for (name in _meshByName)
				{
					_meshByName[name] = null;
					delete _meshByName[name];
				}
				_meshByName = null;
			}
			if (_sparticleMeshByName)
			{
				for (name in _sparticleMeshByName)
				{
					_sparticleMeshByName[name] = null;
					delete _sparticleMeshByName[name];
				}
				_sparticleMeshByName = null;
			}
			if (_objByName)
			{
				for (name in _objByName)
				{
					_objByName[name] = null;
					delete _objByName[name];
				}
				_objByName = null;
			}
			if (_compositeAnimatorGroupByName)
			{
				for (name in _compositeAnimatorGroupByName)
				{
					_compositeAnimatorGroupByName[name] = null;
					delete _compositeAnimatorGroupByName[name];
				}
				_compositeAnimatorGroupByName = null;
			}
			if (_childrenWithAnimatByRoot)
			{
				for (var rootElement : Object in _childrenWithAnimatByRoot)
				{
					var animatChildren : Array = _childrenWithAnimatByRoot[rootElement];
					animatChildren.length = 0;
					_childrenWithAnimatByRoot[rootElement] = null;
					delete _childrenWithAnimatByRoot[rootElement];
				}
				_childrenWithAnimatByRoot = null;
			}
			_layerTypeByName = null;
			_visibleByName = null;
			var materialData : MaterialData;
			if (_independentMaterialMap)
			{
				for (name in _independentMaterialMap)
				{
					materialData = _independentMaterialMap[name];
					materialData.material.dispose();
					_independentMaterialMap[name] = null;
					delete _independentMaterialMap[name];
				}
				_independentMaterialMap = null;
			}
			if (_materialMap)
			{
				for (name in _materialMap)
				{
					materialData = _materialMap[name];
					_materialMap[name] = null;
					delete _materialMap[name];
				}
				_materialMap = null;
			}
			if (_materialLightPickerMap)
			{
				for (name in _materialLightPickerMap)
				{
					_materialLightPickerMap[name] = null;
					delete _materialLightPickerMap[name];
				}
				_materialLightPickerMap = null;
			}
			_effectMethods = null;
			_targetMeterialMap = null;
			//LightPicker是对material做设置的，并且material又是共享的，如果在这里将lightPicker清空，会导致shader频繁生成
			//todo: 将lightPicker的设置移至Avatar3DResource中,然后给Avatar3DResource加上dispose方法，并在dispose方法中将lightPicker清空
			_lightPicker = null;
			_shareMaterials = false;
			_hasSkeletonAnimator = false;
			//_overrideMaterialProps = null;
			_independentColorTransform = null;
			if (_camera3DAnimators)
			{
				_camera3DAnimators.length = 0;
				_camera3DAnimators = null;
			}
		}
	}
}
