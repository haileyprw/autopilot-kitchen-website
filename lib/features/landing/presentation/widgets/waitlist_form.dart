import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/ak_button.dart';
import '../../../../core/widgets/ak_text_field.dart';
import '../../services/waitlist_service.dart';

class WaitlistForm extends StatefulWidget {
  const WaitlistForm({
    super.key,
    required this.service,
    this.compact = false,
  });

  final WaitlistService service;
  final bool compact;

  @override
  State<WaitlistForm> createState() => _WaitlistFormState();
}

class _WaitlistFormState extends State<WaitlistForm> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isLoading = false;
  String? _feedback;
  bool? _success;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
      _feedback = null;
    });

    final result = await widget.service.subscribe(email: _controller.text);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
      _success = result.success;
      _feedback = result.message;
    });

    if (result.success) {
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= LandingBreakpoints.mobile;

    final form = isWide && !widget.compact
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: AkTextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  hint: 'you@example.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                  prefixIcon: Icons.mail_outline,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                flex: 2,
                child: AkButton(
                  label: 'Join Waitlist',
                  onPressed: _submit,
                  isLoading: _isLoading,
                ),
              ),
            ],
          )
        : Column(
            children: [
              AkTextField(
                controller: _controller,
                focusNode: _focusNode,
                hint: 'you@example.com',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                prefixIcon: Icons.mail_outline,
              ),
              const SizedBox(height: AppSpacing.md),
              AkButton(
                label: 'Join Waitlist',
                onPressed: _submit,
                isLoading: _isLoading,
              ),
            ],
          );

    return Column(
      children: [
        form,
        if (_feedback != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            _feedback!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _success == true
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.error,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
