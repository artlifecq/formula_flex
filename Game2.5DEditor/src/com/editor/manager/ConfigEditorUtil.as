package com.editor.manager
{
	import com.editor.cfg.AvatarResConfig;
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.EffectResConfig;
	import com.editor.cfg.GlobalSettingConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InputType;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.ui.ConfigEditView;

	import flash.utils.Dictionary;

	import mx.collections.ArrayCollection;

	/**
	 *
	 * 配置编辑器工具
	 * @author L.L.M.Sunny
	 * 创建时间：2016-3-29 上午10:30:12
	 *
	 */
	public class ConfigEditorUtil
	{
		public function ConfigEditorUtil()
		{
		}

		public static function showConfigEditView(title : String, configData : ConfigData, onSubmit : Function = null) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(configData.tabelName);
			if (!tabel)
				return;
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			var inputTypes : Dictionary = new Dictionary();
			var directionField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_DIRECTION_FIELD);
			if (directionField)
				inputTypes[directionField.mFieldName] = new InputType("int", true, 0, 360, 360);
			var entitySizeScaleField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_SIZE_SCALE_FIELD);
			if (entitySizeScaleField)
				inputTypes[entitySizeScaleField.mFieldName] = new InputType("int", true, 0, 500);

			var inputType : InputType;
			var fieldName : String;
			for (fieldName in configDesc.listMapping)
			{
				inputType = new InputType("list");
				inputType.listData = new ArrayCollection(configDesc.listMapping[fieldName]);
				inputTypes[fieldName] = inputType;
			}
			for (fieldName in configDesc.formatMapping)
			{
				if (configDesc.formatMapping[fieldName] == "color")
				{
					inputType = new InputType("color");
					inputTypes[fieldName] = inputType;
				}
				else if (configDesc.formatMapping[fieldName] == "boolean")
				{
					inputType = new InputType("boolean");
					inputTypes[fieldName] = inputType;
				}
			}

			if (configData is EditorClientMapData)
			{
				inputTypes["miniCorrectScaleX"] = new InputType("int", true, 0.1 * EditorClientMapData.SCALE_RATIO, 4 * EditorClientMapData.SCALE_RATIO);
				inputTypes["miniCorrectScaleY"] = new InputType("int", true, 0.1 * EditorClientMapData.SCALE_RATIO, 4 * EditorClientMapData.SCALE_RATIO);
				inputTypes["miniCorrectTilt"] = new InputType("int", true, -180, 180);
				inputTypes["miniCorrectRoll"] = new InputType("int", true, -180, 180);
				inputTypes["miniCorrectPan"] = new InputType("int", true, -180, 180);
			}
			else if (configData is AvatarResConfig)
			{
				inputTypes["res"] = new InputType("string", false);
				inputTypes["dialogFaceMaskX"] = new InputType("int", true, -800, 800);
				inputTypes["dialogFaceMaskY"] = new InputType("int", true, -800, 800);
				inputTypes["dialogFaceMaskS"] = new InputType("number", true, 0.01, 5);
				inputTypes["dialogFaceMaskR"] = new InputType("int", true, -180, 180);
				inputTypes["headFaceMaskX"] = new InputType("int", true, -800, 800);
				inputTypes["headFaceMaskY"] = new InputType("int", true, -800, 800);
				inputTypes["headFaceMaskS"] = new InputType("number", true, 0.01, 5);
				inputTypes["headFaceMaskR"] = new InputType("int", true, -180, 180);
			}
			else if (configData is EffectResConfig)
			{
				inputTypes["res"] = new InputType("string", false);
			}
			else if (configData is GlobalSettingConfig)
			{
			}

			var window : ConfigEditView = ConfigEditView.open(title, configData);
			window.setData(configData, onInput, onEditViewDragDropCallback, inputTypes, onValidate, function(data : ConfigData) : void
			{
				onSubmitCallback(data);
				if (onSubmit != null)
					onSubmit(data);
			});
		}

		private static function onInput(dataField : String, data : ConfigData) : void
		{
			DataManager.getInstance().changeData(data, dataField);
		}

		private static function onEditViewDragDropCallback(dataField : String, data : ConfigData, dropData : Object) : void
		{
			if (data)
			{
				if (dropData is ConfigData)
				{
					var dropCfg : ConfigData = dropData as ConfigData;
					var orgValue : String = data[dataField];
					orgValue = orgValue + (orgValue ? ";" : "") + dropCfg[dropCfg.majorKey];
					data.setValue(dataField, orgValue);
					DataManager.getInstance().changeData(data, dataField);
				}
			}
		}

		private static function onValidate(dataField : String, data : ConfigData) : Object
		{
			return DataManager.getInstance().dataValidate(dataField, data);
		}

		private static function onSubmitCallback(data : ConfigData) : void
		{
			DataManager.getInstance().submitData(data);
			DataManager.getInstance().changeData(data);
		}
	}
}
