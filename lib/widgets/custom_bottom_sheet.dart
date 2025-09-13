// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_list/cubit/get_task_cubit.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/service/task_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';
import 'package:uuid/uuid.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key, required this.task});
  final Task? task;
  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TaskService taskService = TaskService();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  DateTime? selectedDate;
  Uint8List? selectedImage;
  @override
  void initState() {
    titleController.text = widget.task?.title ?? "";
    descriptionController.text = widget.task?.description ?? "";
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 15,
            children: [
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
                style: TextStyle(color: AppColors.white),
                controller: titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.orange,
                  hint: Text(
                    "Title",
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.red, width: 2),
                  ),
                ),
              ),

              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
                style: TextStyle(color: AppColors.white),
                controller: descriptionController,
                maxLines: 7,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.orange,

                  hint: Text(
                    "Description",
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.red, width: 2),
                  ),
                ),
              ),

              TextField(
                readOnly: true,
                onTap: _pickDate,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.orange,
                  suffixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.white,
                  ),
                  hint: selectedDate == null
                      ? Text(
                          "Deadline(Optional)",
                          style: AppTextStyles.medium16.copyWith(
                            color: AppColors.white,
                          ),
                        )
                      : Text(
                          "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          style: AppTextStyles.medium16.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                onTap: _pickImage,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.orange,
                  suffixIcon: Icon(
                    Icons.image_outlined,
                    color: AppColors.white,
                  ),
                  hint: selectedImage == null
                      ? Text(
                          "Add Image(Optional)",
                          style: AppTextStyles.medium16.copyWith(
                            color: AppColors.white,
                          ),
                        )
                      : Text(
                          "Image Selected",
                          style: AppTextStyles.medium16.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                ),
              ),
              Spacer(),
              CustomButtonWidget(
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  bool isDone = widget.task == null
                      ? await taskService.addTask(
                          Task(
                            id: Uuid().v4(),
                            title: titleController.text,
                            description: descriptionController.text,
                            deadLine: selectedDate,
                            createdAt: DateTime.now(),
                            image: selectedImage,
                          ),
                        )
                      : await taskService.editTask(
                          Task(
                            id: widget.task!.id,
                            title: titleController.text,
                            description: descriptionController.text,
                            deadLine: selectedDate,
                            createdAt: widget.task!.createdAt,
                            image: selectedImage,
                          ),
                        );
                  if (!mounted) return;
                  if (isDone) {
                    context.read<GetTaskCubit>().getTask();
                    Navigator.pop(context, true);
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Please try again")));
                  }
                },
                hieght: 50,
                width: 180,
                color: AppColors.white,
                child: Center(
                  child: Text(
                    widget.task == null ? "Add ToDo" : "Edit ToDo",
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      Uint8List bytes = await image.readAsBytes();
      setState(() {
        selectedImage = bytes;
      });
    }
  }

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2100),
    );

    if (picker != null) {
      setState(() {
        selectedDate = picker;
      });
    }
  }
}
